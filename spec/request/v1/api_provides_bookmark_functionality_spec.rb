RSpec.describe 'API provides bookmark functionality', type: :request do 
  let!(:trail) { create(:trail) } 
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token}
  let(:headers) {{ HTTP_ACCEPT: "application/json" }.merge!(credentials)}

  describe 'user can successfully bookmark a trail' do 

    before do
      post '/v1/bookmarks/',
        params: {
          trail_id: trail.id
        },
        headers: headers
    end
  
    it 'successful bookmark' do
      expect(response_json['message']).to eq 'yay!'
      expect(response.status).to eq 200
    end
  end

  describe 'user can see what they have bookmarked' do 
    before do
      user.bookmarked_trails << trail
      get '/v1/bookmarks/',
      headers: headers
    end
   
    it 'successful retrieve bookmark' do
      expect(response_json).to include 'trail title'
    end

    it 'gives 200 status' do 
      expect(response.status).to eq 200
    end
  end
end