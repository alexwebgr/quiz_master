require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'associations' do
    it { belong_to :question }
    it { belong_to :user }
  end

  describe 'validations' do
    it { should validate_presence_of(:supplied_answer) }
  end
end
