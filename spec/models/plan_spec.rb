require 'rails_helper'

RSpec.describe Plan, type: :model do
  describe 'associations' do
    it { should have_many :subscriptions }
  end

  describe 'validations' do
    it { should validate_presence_of(:label) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:duration_unit) }
  end

  describe '#create_handle' do
    it 'generates a handle before validation removing special character and spaces but not numbers' do
      plan = create(:plan, label: 'Free #@ _ 2')
      expect(plan.handle).to eq 'free2'
    end

    context 'when the plan exists' do
      let!(:existing_plan) { create(:plan, label: 'Free') }
      let(:new_plan) { create(:plan, label: 'Free') }

      it 'rolls back if the plan already exists' do
        expect {new_plan}.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
