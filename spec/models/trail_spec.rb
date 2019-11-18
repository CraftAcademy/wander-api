require 'rails_helper'

RSpec.describe Trail, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :intensity }
    it { is_expected.to have_db_column :duration }
    it { is_expected.to have_db_column :location }
    it { is_expected.to have_db_column :extra }
    it { is_expected.to have_db_column :latitude }
    it { is_expected.to have_db_column :longitude }
    it { is_expected.to have_db_column :continent }
  end
  
  describe 'Validation' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :intensity }
    it { is_expected.to validate_presence_of :duration }
    it { is_expected.to validate_presence_of :location }
    it { is_expected.to validate_presence_of :latitude }
    it { is_expected.to validate_presence_of :longitude }
    it { is_expected.to validate_presence_of :continent }
    it { is_expected.to validate_presence_of :trails_coordinates }
  end

  describe 'Association' do
    it { is_expected.to belong_to :user }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:trail)).to be_valid
    end
  end 

  describe 'Image attachment' do
    let(:image) { File.open(fixture_path + '/testimage.png') }
    
    it 'can be attached to new trail' do 
      subject.image.attach(io: image, 
                          filename: 'attachment_1.png',
                          content_type: 'image/png')
      expect(subject.image).to be_attached
    end
  end 
end