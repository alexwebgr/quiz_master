class Answer < ApplicationRecord
  validates :supplied_answer, presence: true

  belongs_to :user
  belongs_to :question

  def self.submit_answers(params, user)
    params.each do |param|
      next unless param[0].match(/question_/)
      Answer.create!(supplied_answer: param[1], user: user, question_id: param[0].split('_')[1])
    end
  end
end
