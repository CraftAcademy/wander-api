RSpec.describe V1::TrailsController, type: :request do
    describe "Return trail succesfully" do
      let!(:newTrail) { create(:trail) }
    
    before do
      get "/v1/trails/#{newTrail.id}"
    end

    it 'returns the data in its correct structure' do
      expect_response = 
      {
        "id"=>newTrail.id,
        "title"=>newTrail.title,
        "description"=>newTrail.description,
        "intensity"=>newTrail.intensity,
        "extra"=>newTrail.extra,
        "duration"=>newTrail.duration,
        "location"=>newTrail.location
      }

      expect(response_json).to eq expect_response
    end
    
    it 'returns a positive response status' do
      expect(response.status).to eq 200
    end
  end

  describe "Returns no trail" do
    let!(:trail) {create(:trail)}

    before do
      get '/v1/trails/1'
    end

    it "Returns error status" do
      expect(response.status).to eq 400
    end
    
    it 'Returns error message' do
      expect(response_json['error_message']).to eq "There is no trail here go back."
    end
  end
end