require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:answers) }
    it { should have_many :submissions }
    it { should have_many :subscriptions }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }

    it 'generates a token before validation' do
      user = create(:user)
      expect(user.token).to_not be_empty
    end
  end
end
