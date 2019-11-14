RSpec.describe V1::SearchController, type: :request do
  describe 'Search action' do
    let!(:trails) { 3.times { create(:trail, location: 'Stockholm') } }

    before do
      get 'search', to: 'search#Stockholm' #research method
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
      get 'search', to: 'search#'
    end

    it 'gives error message' do
      expect(response_json['error_message']).to eq 'Please enter valid search input'
    end

    it 'gives error status 400' do
      expect(response.status).to eq 400
    end
  end
end