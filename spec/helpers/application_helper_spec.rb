require 'rails_helper'

RSpec.describe 'Helpers' do
  describe '#format_duration' do
    it('returns the duration_unit if it is one') do
      expect(helper.format_duration('month', 2)).to eq 'months'
    end

    it('returns pluralizes the duration_unit if it is more than one') do
      expect(helper.format_duration('month', 1)).to eq 'month'
    end
  end

  describe 'user_tz' do
    # this probably lives in the users or settings table so it is configurable
    it 'returns the timezone' do
      expect(helper.user_tz).to eq 'Europe/Athens'
    end
  end
end