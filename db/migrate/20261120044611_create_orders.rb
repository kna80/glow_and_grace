class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.string :customer_name, null: false
      t.string :email, null: false
      t.text :address, null: false
      t.decimal :total, precision: 10, scale: 2, null: false
      t.string :status, default: "pending", null: false

      t.timestamps
    end
  end
end