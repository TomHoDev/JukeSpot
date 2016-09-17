class SessionsController < ApplicationController

  def new
  end

  def create
    session[:spotify] = env['omniauth.auth']
    user = User.find_or_create_by(spotify_id: spotify_user.id)
    user.update(session_params)
    session[:user_id] = user.id
    redirect_to '/profile'
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private
  def session_params
    spotify_user.credentials.select{ |k,v| ["token", "refresh_token"].include? k }
  end
end
