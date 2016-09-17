class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :juke_track
      t.integer :value
    end
  end
end
