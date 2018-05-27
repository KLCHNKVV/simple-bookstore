module ApplicationHelper

  def hidden_div_if(condition, attributes = {}, &block)
    attributes['style'] = 'display: none' if condition
    content_tag('div', attributes, &block)
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
    self.current_user = user
  end

  def current_user= (user)
    @current_user = user
  end

  def current_user
    remember_token = User.digest(cookies[:remember_token])
    @current_user || User.find_by(remember_token: remember_token)
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def sortable(column, title = 'nil')
    title ||= column.titleize
    direction = column == params[:sort] && params[:direction] == 'asc' ? 'desc' : 'asc'
    link_to title, :sort => column, :direction => direction
  end
end
