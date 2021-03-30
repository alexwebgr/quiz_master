require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'associations' do
    it { should belong_to :question }
    it { should belong_to :user }
  end

  describe 'validations' do
    it { should validate_presence_of(:supplied_answer) }
  end

  describe '#submit_answers' do
    let(:user) { create(:user) }

    context 'when the user replies correctly' do
      let(:question) { create(:question, correct_answer: 'true') }
      let(:valid_attributes) {
        {
          "authenticity_token": "U4jxET0nQ25H1_YMkTO94oP7JRNUUGRZE3X-ktKxvWaJPVoZWFMyyshWFCvsCTQIXswkEoaV6yHV0O5KXEbxbQ",
          "question_#{question.id}": "true",
          "commit": "Submit",
          "controller": "dashboard",
          "action": "submit_answers"
        }
      }

      it 'sets the is_correct correctly' do
        Answer.submit_answers(valid_attributes, user)
        expect(Answer.last.is_correct).to be_truthy
      end
    end

    context 'when the user replies correctly with false' do
      let(:question) { create(:question, correct_answer: 'false') }
      let(:valid_attributes) {
        {
          "authenticity_token": "U4jxET0nQ25H1_YMkTO94oP7JRNUUGRZE3X-ktKxvWaJPVoZWFMyyshWFCvsCTQIXswkEoaV6yHV0O5KXEbxbQ",
          "question_#{question.id}": "false",
          "commit": "Submit",
          "controller": "dashboard",
          "action": "submit_answers"
        }
      }

      it 'sets the is_correct correctly' do
        Answer.submit_answers(valid_attributes, user)
        expect(Answer.last.is_correct).to be_truthy
      end
    end

    context 'when the user replies incorrectly' do
      let(:question) { create(:question, correct_answer: 'true') }
      let(:valid_attributes) {
        {
          "authenticity_token": "U4jxET0nQ25H1_YMkTO94oP7JRNUUGRZE3X-ktKxvWaJPVoZWFMyyshWFCvsCTQIXswkEoaV6yHV0O5KXEbxbQ",
          "question_#{question.id}": "false",
          "commit": "Submit",
          "controller": "dashboard",
          "action": "submit_answers"
        }
      }

      it 'sets the is_correct correctly' do
        Answer.submit_answers(valid_attributes, user)
        expect(Answer.last.is_correct).to be_falsey
      end
    end
  end
end
