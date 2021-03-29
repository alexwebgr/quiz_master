require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'associations' do
    it { belong_to :quiz }
  end

  describe 'validations' do
    it { should validate_presence_of(:label) }
    it { should validate_presence_of(:correct_answer) }
  end
end
