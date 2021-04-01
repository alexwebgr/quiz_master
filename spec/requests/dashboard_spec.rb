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

    describe "GET /take_quiz" do
      let(:quiz) { create(:quiz) }

      it "returns http success" do
        get "/dashboard/take_quiz/#{quiz.id}"
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST /submit_answers" do
      let(:questions) { create_list(:question, 3) }
      let(:quiz) { create(:quiz) }
      let(:valid_attributes) {
        {
          "authenticity_token": "U4jxET0nQ25H1_YMkTO94oP7JRNUUGRZE3X-ktKxvWaJPVoZWFMyyshWFCvsCTQIXswkEoaV6yHV0O5KXEbxbQ",
          "question_#{questions[0].id}": "true",
          "question_#{questions[1].id}": "true",
          "question_#{questions[2].id}": "false",
          "quiz_id": quiz.id,
          "commit": "Submit",
          "controller": "dashboard",
          "action": "submit_answers"
        }
      }
      it "creates answers" do
        expect {
          post dashboard_submit_answers_url, params: valid_attributes
        }.to change(Answer, :count).by(3)
      end

      it "creates a submission" do
        expect {
          post dashboard_submit_answers_url, params: valid_attributes
        }.to change(Submission, :count).by(1)
      end
    end

    describe "GET /results" do
      let!(:submission) { create(:submission, user: user) }
      it "returns http success" do
        get "/dashboard/results"
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /settings" do
      it "returns http success" do
        get "/dashboard/settings"
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /manage_subs" do
      it "returns http success" do
        get "/dashboard/manage_subs"
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /create_sub" do
      let(:plan) { create(:plan, label: 'Free') }
      let!(:subscription_status) { create(:subscription_status, label: 'Active') }

      it "creates a new Subscription with the free plan and active status" do
        get "/dashboard/create_sub", params: { plan_id: plan.id }

        expect(response).to redirect_to dashboard_manage_subs_url
      end
    end

    describe "GET /check_subs" do
      let!(:subscription_status) { create(:subscription_status, label: 'Active') }
      let!(:plan_gm) { create(:plan, label: 'Gold monthly') }
      let!(:plan_gy) { create(:plan, label: 'Gold yearly') }

      it "returns http success" do
        get "/dashboard/check_subs"
        expect(response).to redirect_to dashboard_manage_subs_url
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
