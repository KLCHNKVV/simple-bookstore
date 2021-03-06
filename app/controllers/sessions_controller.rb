class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user.try(:authenticate, params[:password]) && user.email_confirmed
      session[:user_id] = user.id
      redirect_to store_index_url
    else
      redirect_to login_url, alert: 'Invalid user/password combination'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_index_url, notice: 'You logged out.'
  end

  def delete
    session[:user_id] = nil
    redirect_to store_index_url, notice: 'You logged out.'
  end
end
