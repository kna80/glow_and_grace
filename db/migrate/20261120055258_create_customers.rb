class CreateCustomers < ActiveRecord::Migration[7.2]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :address, null: false

      t.references :province, null: false, foreign_key: true

      t.timestamps
    end

    add_index :customers, :email
  end
end