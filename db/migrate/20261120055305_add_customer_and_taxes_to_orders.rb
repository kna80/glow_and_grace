class AddCustomerAndTaxesToOrders < ActiveRecord::Migration[7.2]
  def change
    add_reference :orders, :customer, foreign_key: true

    add_column :orders, :subtotal, :decimal,
               precision: 10, scale: 2

    add_column :orders, :gst_amount, :decimal,
               precision: 10, scale: 2, default: 0

    add_column :orders, :pst_amount, :decimal,
               precision: 10, scale: 2, default: 0

    add_column :orders, :hst_amount, :decimal,
               precision: 10, scale: 2, default: 0
  end
end