RSpec.describe 'API provides show functionality', type: :request do
    describe 'Return trail succesfully' do
      let!(:newTrail) { create(:trail) }
    
    before do
      get "/v1/trails/#{newTrail.id}"
    end

    it 'returns the data in its correct structure' do
      
#binding.pry
      
      expect_response = 
      {'trail'=> 
       { 'id'=>newTrail.id,
        'title'=>newTrail.title,
        'description'=>newTrail.description,
        'intensity'=>newTrail.intensity,
        'extra'=>newTrail.extra,
        'duration'=>newTrail.duration,
        'city'=>newTrail.city,
        'country'=>newTrail.country,
        'continent'=>newTrail.continent,
        'user_id'=>newTrail.user_id,
        'likes'=>newTrail.likes.count,
        'coordinates'=>[],
        'image'=>response_json['image'] },
        'like_status'=>response_json['like_status']
      }

      expect(response_json).to include expect_response
    end
    
    it 'returns a positive response status' do
      expect(response.status).to eq 200
    end
  end

  describe 'Returns no trail' do
    let!(:trail) {create(:trail)}

    before do
      get '/v1/trails/1'
    end

    it 'Returns error status' do
      expect(response.status).to eq 400
    end
    
    it 'Returns error message' do
      expect(response_json['error_message']).to eq 'There is no trail here go back.'
    end
  end
end