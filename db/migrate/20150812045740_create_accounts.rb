class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts, id: false do |t|
      t.integer :number, :primary_key
      t.decimal :balance, :precision => 8, :scale => 2
      t.integer :customer_id
    end
    add_foreign_key :accounts, :customers, on_delete: :cascade
  end
end
