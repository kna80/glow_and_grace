class AddAddressToCustomerAccounts < ActiveRecord::Migration[7.2]
  def change
    add_column :customer_accounts, :full_name, :string
    add_column :customer_accounts, :address, :string
    add_column :customer_accounts, :city, :string
    add_column :customer_accounts, :postal_code, :string

    add_reference :customer_accounts, :province,
                  null: true, foreign_key: true
  end
end