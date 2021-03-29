require 'rails_helper'

RSpec.describe Quiz, type: :model do
  describe 'associations' do
  end

  describe 'validations' do
    it { should validate_presence_of(:label) }
  end
end
