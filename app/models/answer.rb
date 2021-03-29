class Answer < ApplicationRecord
  validates :supplied_answer, presence: true

  belongs_to :user
  belongs_to :question
end
