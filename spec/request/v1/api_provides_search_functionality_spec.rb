RSpec.describe 'API provides search functionality', type: :request do
  describe 'Search action' do
    let!(:trails) { 3.times { create(:trail, location: 'Stockholm') } }

    before do
      get '/v1/search?search=Stockholm'
    end

    it 'returns 3 search results' do
      expect(response_json.count).to eq 3
    end

    it 'search results all contain Stockholm' do
      expect(response_json).to include 'Stockholm'
    end

    it 'gives success status 200' do
      expect(response.status).to eq 200
    end
  end

  describe 'Cannot search if empty search' do
    let!(:trail) { create(:trail) }

    before do
      get '/v1/search?search'
    end

    it 'gives error message' do
      expect(response_json['error_message']).to eq 'Please enter valid search input'
    end

    it 'gives error status 204' do
      expect(response.status).to eq 204
    end
  end
end 
