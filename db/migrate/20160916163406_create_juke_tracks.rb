class CreateJukeTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :juke_tracks do |t|
      t.belongs_to :track
      t.belongs_to :party
      t.string :type
      t.boolean :import

      t.timestamps
    end
  end
end
