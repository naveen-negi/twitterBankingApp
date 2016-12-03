class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :twitter_id
      t.string :twitter_handle
    end
  end
end
