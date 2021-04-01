class Plan < ApplicationRecord
  validates :label, presence: true
  validates :handle, presence: true, uniqueness: true
  validates :price, presence: true
  validates :duration, presence: true
  validates :duration_unit, presence: true

  before_validation :create_handle

  def create_handle
    self.handle = label.downcase.gsub(/[^[:alnum:]]/, '') if label
  end
end
