require 'rails_helper'

RSpec.describe Quiz, type: :model do
  describe 'associations' do
    it { should have_many :questions }
  end

  describe 'validations' do
    it { should validate_presence_of(:label) }
  end
end
