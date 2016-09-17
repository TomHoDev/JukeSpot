class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.integer :spotify_id
      t.timestamps
    end
  end
end
