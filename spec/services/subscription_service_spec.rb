require 'rails_helper'

RSpec.describe SubscriptionService, type: :service do
  describe "#create_sub" do
    let(:user) { create(:user) }
    let!(:sub_status_upcoming) { create(:subscription_status, label: 'Upcoming') }
    let!(:sub_status_active) { create(:subscription_status, label: 'Active') }
    let!(:sub_status_expired) { create(:subscription_status, label: 'Expired') }
    let!(:plan_free) { create(:plan, label: 'Free') }
    let!(:plan_gm) { create(:plan, label: 'Gold monthly') }
    let!(:plan_gy) { create(:plan, label: 'Gold yearly') }


    context 'when the user is new and does not have any subscriptions' do
      it "creates a new Subscription with the free plan and active status" do
        described_class.create_sub(plan_free.id, user.id)

        # expect(Subscription.count).to eq 1
        expect(Subscription.last.plan.handle).to eq 'free'
        expect(Subscription.last.subscription_status.handle).to eq 'active'
      end
    end

    context 'when the user decides to upgrade to the gold monthly plan' do
      let!(:free_sub) { create(:subscription, plan: plan_free, subscription_status: sub_status_active, user: user) }

      it "creates a new Subscription the gold monthly plan and upcoming status" do
        described_class.create_sub(plan_gm.id, user.id)

        # expect(Subscription.count).to eq 1
        expect(Subscription.last.plan.handle).to eq 'goldmonthly'
        expect(Subscription.last.subscription_status.handle).to eq 'active'
        # TODO: expire subs
        # expect(free_sub.subscription_status.handle).to eq 'expired'
      end
    end

    context 'when the user decides to change from gold monthly to gold yearly plan' do
      let!(:free_sub) { create(:subscription, plan: plan_free, subscription_status: sub_status_expired, user: user) }
      let!(:gm_sub) { create(:subscription, plan: plan_gm, subscription_status: sub_status_active, user: user) }

      it "creates a new Subscription with the gold yearly plan and upcoming status" do
        described_class.create_sub(plan_gy.id, user.id)

        # expect { described_class.create_sub(plan.id, user.id) }.to change(Subscription, :count).by 1
        expect(Subscription.last.plan.handle).to eq 'goldyearly'
        expect(Subscription.last.subscription_status.handle).to eq 'upcoming'
        expect(gm_sub.subscription_status.handle).to eq 'active'
      end
    end

    context 'when the user decides to change from gold yearly to gold monthly plan' do
      let!(:free_sub) { create(:subscription, plan: plan_free, subscription_status: sub_status_expired, user: user) }
      let!(:gm_sub) { create(:subscription, plan: plan_gm, subscription_status: sub_status_expired, user: user) }
      let!(:gy_sub) { create(:subscription, plan: plan_gy, subscription_status: sub_status_active, user: user) }

      it "creates a new Subscription with the gold monthly plan and upcoming status" do
        described_class.create_sub(plan_gm.id, user.id)

        # expect { described_class.create_sub(plan.id, user.id) }.to change(Subscription, :count).by 1
        expect(Subscription.last.plan.handle).to eq 'goldmonthly'
        expect(Subscription.last.subscription_status.handle).to eq 'upcoming'
        expect(gy_sub.subscription_status.handle).to eq 'active'
      end
    end

    context 'when the user decides to change from gold monthly to free plan' do
      let!(:free_sub) { create(:subscription, plan: plan_free, subscription_status: sub_status_expired, user: user) }
      let!(:gm_sub) { create(:subscription, plan: plan_gm, subscription_status: sub_status_expired, user: user) }
      let!(:gy_sub) { create(:subscription, plan: plan_gy, subscription_status: sub_status_expired, user: user) }
      let!(:gm_sub) { create(:subscription, plan: plan_gm, subscription_status: sub_status_active, user: user) }

      it "creates a new Subscription with the free plan and upcoming status" do
        described_class.create_sub(plan_free.id, user.id)

        # expect { described_class.create_sub(plan.id, user.id) }.to change(Subscription, :count).by 1
        expect(Subscription.last.plan.handle).to eq 'free'
        expect(Subscription.last.subscription_status.handle).to eq 'upcoming'
        expect(gm_sub.subscription_status.handle).to eq 'active'
      end
    end
  end
end