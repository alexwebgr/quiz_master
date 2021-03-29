class Quiz < ApplicationRecord
  validates :label, presence: true
  has_many :questions
end
