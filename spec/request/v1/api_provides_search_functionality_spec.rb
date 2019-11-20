RSpec.describe 'API provides search functionality', type: :request do
  describe 'displays search results' do
    let!(:trail_1) { create(:trail, title: 'Stockholm Hagaparken Trail') }
    let!(:trail_2) { create(:trail, city: 'Stockholm') }
    
    before do
      get '/v1/trails/?search=Stockholm'
    end
   
    it 'returns 2 trails' do
      expect(response_json.count).to eq 2
    end 

    it 'trail has search query within title' do
      expect(response_json.first['title']).to include 'Stockholm'
    end

    it 'trail has search query as city' do
      expect(response_json.second['city']).to include 'Stockholm'
    end
  end

  describe 'returns error if there are no trails' do
    before do
      get '/v1/trails/?search'
    end

    it 'returns error status' do
      expect(response.status).to eq 400
    end

    it 'returns error message' do
      expect(response_json['error_message']).to eq 'No trails here, turn around.'
    end
  end
end