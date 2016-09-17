class AddPlaylistOwnerToParty < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :playlist_owner_id, :string
  end
end
