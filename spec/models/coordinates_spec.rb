require 'rails_helper'

RSpec.describe Coordinate, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column :latitude }
    it { is_expected.to have_db_column :longitude }
  end

  describe "Relations" do
    it { is_expected.to belong_to :trail }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:coordinate)).to be_valid
    end
  end 

end