require 'rails_helper'

RSpec.describe SubscriptionStatus, type: :model do
  describe 'associations' do
    it { should have_many :subscriptions }
  end

  describe 'validations' do
    it { should validate_presence_of(:label) }
  end

  describe '#create_handle' do
    it 'generates a handle before validation removing special character and spaces but not numbers' do
      subscription_status = create(:subscription_status, label: 'Upcoming $# 3')
      expect(subscription_status.handle).to eq 'upcoming3'
    end

    context 'when the subscription_status exists' do
      let!(:existing_subscription_status) { create(:subscription_status, label: 'Active') }
      let(:new_subscription_status) { create(:subscription_status, label: 'Active') }

      it 'rolls back if the subscription_status already exists' do
        expect {new_subscription_status}.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
