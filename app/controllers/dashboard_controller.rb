class DashboardController < ApplicationController
  def quizzes
    @quizzes = Quiz.all
  end

  def take_quiz
    @quiz = Quiz.find_by(id: params[:quiz_id])
  end

  def settings
  end
end
