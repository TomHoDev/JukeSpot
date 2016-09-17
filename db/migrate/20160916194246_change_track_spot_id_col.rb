class ChangeTrackSpotIdCol < ActiveRecord::Migration[5.0]
  def change
    remove_column :tracks, :spotify_id
    add_column :tracks, :spotify_id, :string, index: true
  end
end
