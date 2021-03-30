class DashboardController < ApplicationController
  def quizzes
    @quizzes = Quiz.all
  end

  def take_quiz
    @quiz = Quiz.find_by(id: params[:quiz_id])
  end

  def submit_answers
    Answer.submit_answers(params, current_user)
    redirect_to dashboard_results_url
  end

  def results
  end

  def settings
  end
end
