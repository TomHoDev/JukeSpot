class ChangeTypeCols < ActiveRecord::Migration[5.0]
  def change
    remove_column :juke_tracks, :type
    add_column :juke_tracks, :active, :boolean, index: true

    remove_column :memberships, :type
    add_column :memberships, :host, :boolean, index: true
  end
end
