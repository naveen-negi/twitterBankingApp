class ChangeTwitterIdToString < ActiveRecord::Migration
  def change
    change_table :customers do |t|
      t.change :twitter_id, :string
    end
  end
end
