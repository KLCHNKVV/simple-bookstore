class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :admin

  protected
  def admin
    false
  end

  def authorize
    unless admin
      redirect_to store_index_url
      flash[:notice] = 'Unauthorized access'
      return false
    end
  end

end
