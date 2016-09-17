Rails.application.routes.draw do

  resources :parties
  patch '/parties/:party_id/new_playlist' => 'parties#new_playlist'
  patch '/parties/:party_id/import' => 'parties#import'

  get '/profile' => 'users#profile'

  get '/juke_tracks/:juke_track_id/vote_up' => 'votes#up'
  get '/juke_tracks/:juke_track_id/vote_down' => 'votes#down'

  # auth routes
  get '/auth/spotify/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  root 'application#home'
end
