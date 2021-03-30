require 'rails_helper'

RSpec.describe Submission, type: :model do
  describe 'associations' do
    it { should belong_to :quiz }
    it { should belong_to :user }
  end

  describe 'validations' do
    it { should validate_presence_of(:answers) }
    it { should validate_presence_of(:score) }
  end
end
