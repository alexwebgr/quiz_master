class SessionsController < ApplicationController
  skip_before_action :require_login

  def home
    @users = User.all
  end

  def login
    user = User.find_by(id: params[:user_id])

    if user
      session[:current_user_id] = user.id
      redirect_to dashboard_quizzes_url, notice: "Welcome #{user.first_name}"
    else
      redirect_to root_url, notice: 'user not found'
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_url
  end
end
