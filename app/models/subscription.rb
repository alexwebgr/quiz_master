class Subscription < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :user
  belongs_to :plan
  belongs_to :subscription_status
end
