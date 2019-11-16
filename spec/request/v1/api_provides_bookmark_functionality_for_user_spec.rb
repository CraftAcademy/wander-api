RSpec.describe 'API provides bookmark functionality' do 
  describe 'user can successfully bookmark a trail' do 
    let!(:trail) { create(:trail) } 
    let(:user) { create(:user) }
    let(:credentials) { user.create_new_auth_token}
    let(:headers) {{ HTTP_ACCEPT: "application/json" }.merge!(credentials)}

    before do
      get '/v1/trails'
      post '/v1/bookmark/create',
        params: {
          user: user.id,
          trail: trail.id
        },
        headers: headers
    end
   
    it 'successful bookmark' do 
      expect(response_json).to eq 'unknown'
    end

    it 'gives 200 status' do 
      expect(reponse.status).to eq 200
    end
  end
end