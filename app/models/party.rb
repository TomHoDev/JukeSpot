class Party < ApplicationRecord
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :juke_tracks

  def host
    memberships.where(host: true).first.user
  end

  def playlist
    RSpotify::Playlist.find(playlist_owner_id, spotify_playlist_id) if spotify_playlist_id && playlist_owner_id
  end

  def active_tracks
    juke_tracks.where(active: true)
  end

  def staged_tracks
    juke_tracks.where(active: false)
  end
end
