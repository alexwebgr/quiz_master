class Question < ApplicationRecord
  validates :label, presence: true
  validates :correct_answer, presence: true

  belongs_to :quiz
  has_many :answers
end
