RSpec.describe 'API provides bookmark functionality', type: :request do 
  let!(:trail) { create(:trail) } 
  let!(:trail_2) { create(:trail) } 
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
  
    it 'gives success message' do
      expect(response_json['message']).to eq 'Saved trail to your bookmarks!'
    end

    it 'gives status 200' do
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
      expect(response_json[0]).to include {trail.title}
    end

    it 'gives status 200' do 
      expect(response.status).to eq 200
    end
  end

  describe 'user can remove a bookmark' do 
    before do
      user.bookmarked_trails << trail
      user.bookmarked_trails << trail_2
      delete "/v1/bookmarks/#{trail.id}",
      params: {
        trail_id: trail.id
      },
      headers: headers
    end

    it 'successfully remove bookmark' do 
      expect(response_json['message']).to include 'Removed bookmark!'
    end

    it 'gives status 200' do 
      expect(response.status).to eq 200
    end

    it 'user bookmarks are empty' do 
      expect(response_json).not_to include {trail.title}
    end
  end
end