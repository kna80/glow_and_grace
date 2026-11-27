class AddMissingFieldsToCustomerAccounts < ActiveRecord::Migration[7.2]
  def change
    add_column :customer_accounts, :username, :string
    add_index :customer_accounts, :username, unique: true
  end
end
