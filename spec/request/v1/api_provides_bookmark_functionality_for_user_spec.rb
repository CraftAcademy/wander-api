RSpec.describe 'API provides bookmark functionality' do 
  describe 'user can successfully bookmark a trail', type: :request do 
    let!(:trail) { create(:trail) } 
    let(:user) { create(:user) }
    let(:credentials) { user.create_new_auth_token}
    let(:headers) {{ HTTP_ACCEPT: "application/json" }.merge!(credentials)}

    before do
      post '/v1/bookmarks/',
        params: {
          user_id: user.id,
          trail_id: trail.id
        },
        headers: headers
    end
   
    it 'successful bookmark' do 
      expect(response_json).to include 'id'
    end

    it 'gives 200 status' do 
      expect(response.status).to eq 200
    end
  end
end