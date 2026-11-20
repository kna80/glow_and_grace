ActiveAdmin.register Order do
  menu priority: 3

  actions :index, :show, :edit, :update

  permit_params :status

  config.sort_order = "created_at_desc"

  filter :id
  filter :status
  filter :created_at

  index do
    id_column

    column "Customer" do |order|
      order.customer&.name || order.customer_name
    end

    column :email

    column :total do |order|
      number_to_currency(order.total)
    end

    column :status
    column :created_at

    actions
  end

  show do
    attributes_table do
      row :id
      row :customer_name
      row :email
      row :address

      row "Province" do |order|
        order.customer&.province&.name || "Not available"
      end

      row :status

      row :subtotal do |order|
        number_to_currency(order.subtotal || order.total)
      end

      row :gst_amount do |order|
        number_to_currency(order.gst_amount || 0)
      end

      row :pst_amount do |order|
        number_to_currency(order.pst_amount || 0)
      end

      row :hst_amount do |order|
        number_to_currency(order.hst_amount || 0)
      end

      row :total do |order|
        number_to_currency(order.total)
      end

      row :created_at
    end

    panel "Purchased Products" do
      table_for resource.order_items.includes(:product) do
        column "Product" do |item|
          item.product&.name || "Product unavailable"
        end

        column :quantity

        column :price do |item|
          number_to_currency(item.price)
        end

        column "Subtotal" do |item|
          number_to_currency(item.price * item.quantity)
        end
      end
    end
  end

  form do |f|
    f.inputs "Update Order Status" do
      f.input :status,
              as: :select,
              collection: %w[
                pending
                processing
                shipped
                delivered
                cancelled
              ],
              include_blank: false
    end

    f.actions
  end
end
