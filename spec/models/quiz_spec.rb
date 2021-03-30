require 'rails_helper'

RSpec.describe Quiz, type: :model do
  describe 'associations' do
    it { should have_many :questions }
    it { should have_many :submissions }
  end

  describe 'validations' do
    it { should validate_presence_of(:label) }
  end
end
