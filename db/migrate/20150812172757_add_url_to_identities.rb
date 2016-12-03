class AddUrlToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :url, :string
  end
end
