 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/quizzes", type: :request do
  
  # Quiz. As you add validations to Quiz, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      label: 'Quiz 1'
    }
  }

  let(:invalid_attributes) {
    {
      label: nil
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Quiz.create! valid_attributes
      get quizzes_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      quiz = Quiz.create! valid_attributes
      get quiz_url(quiz)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_quiz_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      quiz = Quiz.create! valid_attributes
      get edit_quiz_url(quiz)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Quiz" do
        expect {
          post quizzes_url, params: { quiz: valid_attributes }
        }.to change(Quiz, :count).by(1)
      end

      it "redirects to the created quiz" do
        post quizzes_url, params: { quiz: valid_attributes }
        expect(response).to redirect_to(quiz_url(Quiz.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Quiz" do
        expect {
          post quizzes_url, params: { quiz: invalid_attributes }
        }.to change(Quiz, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post quizzes_url, params: { quiz: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          label: 'Quiz 2'
        }
      }

      it "updates the requested quiz" do
        quiz = Quiz.create! valid_attributes
        patch quiz_url(quiz), params: { quiz: new_attributes }
        quiz.reload
        expect(quiz.label).to eq new_attributes[:label]
      end

      it "redirects to the quiz" do
        quiz = Quiz.create! valid_attributes
        patch quiz_url(quiz), params: { quiz: new_attributes }
        quiz.reload
        expect(response).to redirect_to(quiz_url(quiz))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        quiz = Quiz.create! valid_attributes
        patch quiz_url(quiz), params: { quiz: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested quiz" do
      quiz = Quiz.create! valid_attributes
      expect {
        delete quiz_url(quiz)
      }.to change(Quiz, :count).by(-1)
    end

    it "redirects to the quizzes list" do
      quiz = Quiz.create! valid_attributes
      delete quiz_url(quiz)
      expect(response).to redirect_to(quizzes_url)
    end
  end
end
