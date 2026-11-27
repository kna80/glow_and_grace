class AddMissingFieldsToCustomerAccounts < ActiveRecord::Migration[7.2]
  def change
    add_column :customer_accounts, :username, :string
    add_column :customer_accounts, :postal_code, :string
    add_reference :customer_accounts, :province, null: false, foreign_key: true
  end
end
