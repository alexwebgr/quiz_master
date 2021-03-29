require 'rails_helper'

RSpec.describe "Dashboards", type: :request do
  describe 'logged in' do
    let(:user) { create(:user) }

    before do
      get "/sessions/login/#{user.id}"
    end

    describe "GET /quizzes" do
      it "returns http success" do
        get "/dashboard/quizzes"
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /settings" do
      it "returns http success" do
        get "/dashboard/settings"
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'non-logged in user' do
    describe "GET /quizzes" do
      it "returns http success" do
        get "/dashboard/quizzes"
        expect(response).to redirect_to root_url
      end
    end

    describe "GET /settings" do
      it "returns http success" do
        get "/dashboard/settings"
        expect(response).to redirect_to root_url
      end
    end
  end
end
