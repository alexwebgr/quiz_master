require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/sessions/home"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /login" do
    let(:user) { create(:user) }

    it "raises an exception if the user_id is missing" do
      expect { get "/sessions/login" }.to raise_error ActionController::RoutingError
    end

    it "redirects to sessions/home if the user does not exist" do
      get "/sessions/login/123"
      expect(response).to redirect_to root_url
    end

    it "returns http success" do
      get "/sessions/login/#{user.id}"
      expect(response).to redirect_to dashboard_quizzes_url
    end
  end

  describe "DELETE /logout" do
    it "returns http success" do
      delete "/sessions/logout"
      expect(response).to redirect_to root_url
    end
  end
end
