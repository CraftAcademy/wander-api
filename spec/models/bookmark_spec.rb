require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  describe 'Association' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :trail }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:bookmark)).to be_valid
    end
  end 
end