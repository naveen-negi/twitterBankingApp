class AddAccountNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :account_number, :string
    add_column :users, :balance, :float, precision: 64, scale: 12
  end
end
