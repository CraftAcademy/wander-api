RSpec.describe V1::TrailsController, type: :request do
    describe "Return trail succesfully" do
      let!(:trail) {create(:trail)}
    
    before do
      get '/v1/trails/#{trail.id}'
    end

    it 'returns the data in its correct structure' do
      expect_response = 
      {
        "id"=>Trail.last.id,
        "title"=>"title",
        "description"=>"descriptionText",
        "intensity"=>1,
        "extra"=>"extra extra",
        "duration"=>50,
        "location"=> "Barkaby centrum"
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

    it "Returns no error status" do
      expect(response.status).to eq 404
    end
    
    it 'Returns error message' do
      expect(response_json).to eq "There are no trails here turn around"
    end
  end
end