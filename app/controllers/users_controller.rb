class UsersController < ApplicationController

  def profile
    render 'profile'
  end

  def spotify
    session[:spotify] = env['omniauth.auth']
    user = User.find_or_create_by(spotify_id: spotify_user.id)
    user.update(session_params)
    session[:user_id] = user.id
    redirect_to '/profile'
  end
end
