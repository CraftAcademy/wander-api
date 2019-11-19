RSpec.describe V1::TrailsController, type: :request do
  describe 'displays a list of trails' do
    let!(:trail) { 2.times { create(:trail) } }
    
    before do
      get '/v1/trails'
    end
   
    it 'returns 2 trails' do
      expect(response_json.count).to eq 2
    end 

    it 'trail has title' do
      expect(response_json.first['title']).to eq Trail.first.title
    end

    it 'trail has image' do
      expect(response_json.first).to include 'image'
    end
  end

  describe 'returns error if there are no trails' do
    before do
      get '/v1/trails'
    end

    it 'returns error status' do
      expect(response.status).to eq 400
    end

    it 'returns error message' do
      expect(response_json['error_message']).to eq 'No trails here, turn around.'
    end
  end
end