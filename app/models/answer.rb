class Answer < ApplicationRecord
  validates :supplied_answer, presence: true

  belongs_to :user
  belongs_to :question

  def self.submit_answers(params, user)
    answers = []
    params.each do |param|
      next unless param[0].match(/question_/)
      q = Question.find(param[0].to_s.split('_')[1])

      answer = Answer.create!({
                       supplied_answer: param[1],
                       is_correct: q.correct_answer == param[1],
                       question: q,
                       user: user
                     })
      answers << [answer.id, answer.is_correct]
    end

    answers
  end
end
