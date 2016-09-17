class AddPlaylistIdToParties < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :spotify_playlist_id, :string
  end
end
