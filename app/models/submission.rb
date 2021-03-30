class Submission < ApplicationRecord
  validates :answers, presence: true
  validates :score, presence: true

  belongs_to :user
  belongs_to :quiz
end
