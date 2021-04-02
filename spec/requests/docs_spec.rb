require 'rails_helper'

RSpec.describe "Docs", type: :request do
  describe "GET /index" do
    let(:user) { create(:user) }

    context 'when not logged in' do
      it "redirects to the root_url" do
        get "/docs/index"
        expect(response).to redirect_to root_url
      end
    end

    context 'logged in' do
      let!(:sub_status_active) { create(:subscription_status, label: 'Active') }
      let!(:plan_gm) { create(:plan, label: 'Gold monthly') }
      let!(:plan_gy) { create(:plan, label: 'Gold yearly') }

      context 'when user does not have a paid subscription' do
        it "redirects to the root_url" do
          get "/sessions/login/#{user.id}"
          get "/docs/index"
          expect(response).to redirect_to dashboard_manage_subs_url
        end
      end

      context 'when user has a paid subscription' do
        let!(:new_sub) { create(:subscription, plan: plan_gm, user: user, subscription_status: sub_status_active) }

        it "returns http success" do
          get "/sessions/login/#{user.id}"
          get "/docs/index"
          expect(response).to have_http_status 200
        end
      end
    end
  end
end
