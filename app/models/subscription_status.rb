class SubscriptionStatus < ApplicationRecord
  validates :label, presence: true
  validates :handle, presence: true, uniqueness: true

  has_many :subscriptions

  before_validation :create_handle

  def create_handle
    self.handle = label.downcase.gsub(/[^[:alnum:]]/, '') if label
  end

  scope :upcoming, -> { where(handle: 'upcoming').first }
  scope :active, -> { where(handle: 'active').first }
  scope :expired, -> { where(handle: 'expired').first }
end
