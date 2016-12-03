class RemovePrimaryKeyFieldFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :primary_key
  end
end
