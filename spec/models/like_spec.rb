require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Association' do
    it { is_expected.to belong_to :trail }
    it { is_expected.to belong_to :user }
  end
end