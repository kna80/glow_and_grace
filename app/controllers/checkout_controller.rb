class CheckoutController < ApplicationController
  before_action :load_cart, only: [:new, :create]

  def new
    if @cart_items.empty?
      redirect_to cart_path, alert: "Your cart is empty."
      return
    end

    @order = Order.new

    if customer_account_signed_in?
      account = current_customer_account

      @order.customer_name = account.full_name
      @order.email = account.email
      @order.address = [
        account.address,
        account.city,
        account.postal_code
      ].reject(&:blank?).join(", ")
    end
    @provinces = Province.order(:name)
  end

  def create
    if @cart_items.empty?
      redirect_to cart_path, alert: "Your cart is empty."
      return
    end

    @order = Order.new(order_params)
    @provinces = Province.order(:name)

    province = Province.find_by(id: params[:province_id])

    unless province
      @order.errors.add(:base, "Please select a valid province.")
      render :new, status: :unprocessable_entity
      return
    end

    subtotal = @cart_total

    # Calculate Canadian taxes
    gst = (subtotal * province.gst_rate / 100).round(2)
    pst = (subtotal * province.pst_rate / 100).round(2)
    hst = (subtotal * province.hst_rate / 100).round(2)

    total = subtotal + gst + pst + hst

    # Store order amounts
    @order.subtotal = subtotal
    @order.gst_amount = gst
    @order.pst_amount = pst
    @order.hst_amount = hst
    @order.total = total
    @order.status = "pending"

    unless @order.valid?
      render :new, status: :unprocessable_entity
      return
    end

    begin
      Order.transaction do
        # Save customer details
        customer = Customer.create!(
          name: @order.customer_name,
          email: @order.email,
          address: @order.address,
          province: province
        )

        @order.customer = customer

        # Check stock and update inventory
        @cart_items.each do |item|
          product = Product.lock.find(item[:product].id)
          quantity = item[:quantity]

          unless product.active? && product.stock_quantity >= quantity
            raise ActiveRecord::RecordInvalid.new(product)
          end

          product.update!(
            stock_quantity: product.stock_quantity - quantity
          )
        end

        # Save order
        @order.save!

        # Save purchased products
        @cart_items.each do |item|
          @order.order_items.create!(
            product: item[:product],
            quantity: item[:quantity],
            price: item[:product].price
          )
        end
      end

      # Save order ID for confirmation page
      session[:last_order_id] = @order.id

      # Empty shopping cart after successful order
      session[:cart] = {}

      redirect_to order_confirmation_path(@order),
                  notice: "Order placed successfully!"

    rescue ActiveRecord::RecordInvalid,
           ActiveRecord::RecordNotSaved
      redirect_to cart_path,
                  alert: "Unable to place your order. Please check product availability."
    end
  end

  def show
    @order = Order.includes(
      :customer,
      order_items: :product
    ).find_by!(
      id: params[:id]
    )

    unless session[:last_order_id].to_i == @order.id
      raise ActiveRecord::RecordNotFound
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :customer_name,
      :email,
      :address
    )
  end

  def load_cart
    session[:cart] ||= {}

    @cart_items = []

    session[:cart].each do |product_id, quantity|
      product = Product.find_by(
        id: product_id,
        active: true
      )

      next unless product

      quantity = quantity.to_i
      next unless quantity.positive?

      @cart_items << {
        product: product,
        quantity: quantity,
        subtotal: product.price * quantity
      }
    end

    @cart_total = @cart_items.sum do |item|
      item[:subtotal]
    end
  end
end