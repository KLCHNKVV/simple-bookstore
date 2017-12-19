class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize

  def index

  end

  protected
  def authorize
    # unless User.find_by(id: session[:user_id])
    #   redirect_to login_url, notice: 'You should login'
    # end
  end

end
