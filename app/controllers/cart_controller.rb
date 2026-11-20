class CartController < ApplicationController
  before_action :initialize_cart

  def index
    @cart_items = []

    session[:cart].each do |product_id, quantity|
      product = Product.find_by(id: product_id, active: true)

      next unless product

      @cart_items << {
        product: product,
        quantity: quantity.to_i,
        subtotal: product.price * quantity.to_i
      }
    end

    @cart_total = @cart_items.sum { |item| item[:subtotal] }
  end

  def add
    product = Product.find_by!(id: params[:product_id], active: true)

    quantity = params.fetch(:quantity, 1).to_i

    if quantity < 1
      redirect_to product_path(product), alert: "Invalid quantity."
      return
    end

    product_id = product.id.to_s
    current_quantity = session[:cart].fetch(product_id, 0).to_i

    if current_quantity + quantity > product.stock_quantity
      redirect_to product_path(product), alert: "Not enough stock available."
      return
    end

    session[:cart][product_id] = current_quantity + quantity

    redirect_to cart_path, notice: "#{product.name} added to cart!"
  end

  def update
    product_id = params[:product_id].to_s
    product = Product.find_by(id: product_id, active: true)

    unless product && session[:cart].key?(product_id)
      redirect_to cart_path, alert: "Product not found in cart."
      return
    end

    quantity = params[:quantity].to_i

    if quantity <= 0
      session[:cart].delete(product_id)
      redirect_to cart_path, notice: "Product removed from cart."
    elsif quantity > product.stock_quantity
      redirect_to cart_path, alert: "Not enough stock available."
    else
      session[:cart][product_id] = quantity
      redirect_to cart_path, notice: "Cart updated successfully!"
    end
  end

  def remove
    session[:cart].delete(params[:product_id].to_s)

    redirect_to cart_path, notice: "Product removed from cart."
  end

  private

  def initialize_cart
    session[:cart] ||= {}
  end
end