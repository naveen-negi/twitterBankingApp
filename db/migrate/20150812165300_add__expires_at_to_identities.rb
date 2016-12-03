class AddExpiresAtToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :expires_at, :string
  end
end
