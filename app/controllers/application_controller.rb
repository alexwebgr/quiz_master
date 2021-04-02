class ApplicationController < ActionController::Base
  before_action :require_login
  helper_method :current_user, :logged_in?, :calculate_score, :has_active_paid_subs?

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def calculate_score(answers)
    ((answers.flatten.count(true).to_f / answers.size.to_f) * 100.0).round(2)
  end

  def has_active_paid_subs?(user_id = current_user.id)
    SubscriptionService.has_active_paid_subs?(user_id)
  end

  def require_paid_sub
    unless has_active_paid_subs?
      flash[:danger] = 'You need a paid subscription to access this area.'
      redirect_to dashboard_manage_subs_url
    end
  end

  private
  def require_login
    unless logged_in?
      flash[:danger] = 'You need to sign in to perform this action.'
      redirect_to root_url
    end
  end
end
