class PartiesController < ApplicationController
  def new
  end

  def create
    @party = current_user.parties.create(party_params)
    @party.memberships.where(user_id: current_user).first.update(host: true)
    redirect_to @party
  end

  def show
    @party = Party.find(params[:id])
    @playlist = RSpotify::Playlist.find(@party.playlist_owner_id, @party.spotify_playlist_id) if @party.spotify_playlist_id
  end

  def import
    @party = Party.find params[:party_id]
    @party.update(spotify_playlist_id: params[:playlist_id], playlist_owner_id: params[:owner_id])
    import_tracks
    redirect_to @party
  end

  def new_playlist
    @party = Party.find(params[:party_id])
    @playlist = spotify_user.create_playlist!(@party.name)
    @party.update(spotify_playlist_id: @playlist.id, playlist_owner_id: spotify_user.id)
    redirect_to @party
  end

  private
  def party_params
    params.required(:party).permit(:name, :threshold)
  end

  def import_tracks
    @party.playlist.tracks.each do |track|
      track_to_import = Track.find_or_create_by(spotify_id: track.id, name: track.name)
      JukeTrack.find_or_create_by(track_id: track_to_import.id, party_id: @party.id, active: true, import: true)
    end
  end
end
