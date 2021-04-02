class DashboardController < ApplicationController
  def quizzes
    @quizzes = Quiz.all
  end

  def take_quiz
    @quiz = Quiz.find_by(id: params[:quiz_id])
  end

  def submit_answers
    answers = Answer.submit_answers(params, current_user)
    Submission.create!(
      answers: answers.map { |id| id[0] }.join(','),
      score: calculate_score(answers),
      user: current_user,
      quiz_id: params[:quiz_id]
    )
    redirect_to dashboard_results_url
  end

  def results
    @last_sub = current_user.submissions.last
    @answers = Answer.includes(:question).where(id: @last_sub.answers.split(','))
  end

  def settings
  end

  def manage_subs
    @active_sub = SubscriptionService.active_sub(current_user.id)
    @plans = Plan.all
  end

  def create_sub
    SubscriptionService.create_sub(params[:plan_id], current_user.id)
    redirect_to dashboard_manage_subs_url
  end

  def check_subs
    SubscriptionService.expire_paid_subs
    redirect_to dashboard_manage_subs_url
  end
end
