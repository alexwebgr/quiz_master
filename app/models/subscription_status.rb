class SubscriptionStatus < ApplicationRecord
  validates :label, presence: true
  validates :handle, presence: true, uniqueness: true

  before_validation :create_handle

  def create_handle
    self.handle = label.downcase.gsub(/[^[:alnum:]]/, '') if label
  end
end
