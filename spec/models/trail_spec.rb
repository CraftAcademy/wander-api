require 'rails_helper'

RSpec.describe Trail, type: :model do
  describe 'DB table' do
  it { is_expected.to have_db_column :title }
  it { is_expected.to have_db_column :description }
  it { is_expected.to have_db_column :intensity }
  it { is_expected.to have_db_column :duration }
  it { is_expected.to have_db_column :location }
  it { is_expected.to have_db_column :extra }
  end
  
  describe 'Validation' do

  end

  describe 'Factory' do

  end
end
