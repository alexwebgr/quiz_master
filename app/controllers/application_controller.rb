class ApplicationController < ActionController::Base
  before_action :require_login
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  private
  def require_login
    unless logged_in?
      flash[:danger] = 'You need to sign in to perform this action.'
      redirect_to root_url
    end
  end
end
