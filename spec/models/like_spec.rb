require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column :value }
  end

  describe 'Association' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :trail }
  end
end