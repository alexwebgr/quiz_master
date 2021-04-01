class User < ApplicationRecord
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :token, presence: true, uniqueness: true

  has_many :answers
  has_many :submissions
  has_many :subscriptions

  before_validation :create_token

  private
  def create_token
    self.token = SecureRandom.urlsafe_base64
  end
end
