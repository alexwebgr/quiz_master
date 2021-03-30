class Quiz < ApplicationRecord
  validates :label, presence: true

  has_many :questions
  has_many :submissions
end
