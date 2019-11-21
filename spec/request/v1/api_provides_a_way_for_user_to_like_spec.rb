RSpec.describe 'Like Functionality', type: :request do
  let!(:trail) { create(:trail) }
  let(:user_1) { create(:user) }
  let(:credentials) { user_1.create_new_auth_token }
  let(:headers) {{ HTTP_ACCEPT: "application/json" }.merge!(credentials)}

  describe 'User can like a trail' do
    before do
      post '/v1/likes/',
        params: {
          trail_id: trail.id,
          user_id: user_1.id,
        },
        headers: headers
    end

    it 'Gives status 200' do
      expect(response.status).to eq 200
    end
  end

  describe 'User can UnLike a trail' do
    before do
      like = Like.create(user_id: user_1.id, trail_id: trail.id)
      binding.pry
      delete "/v1/likes/#{like.id}",
        params: {
          trail_id: trail.id,
          user_id: user_1.id,
        },
        headers: headers
    end

    it 'Gives status 200' do
      binding.pry
      expect(response.status).to eq 200      
    end
  end

  describe 'Visible likes amount' do
    before do
      get '/v1/likes/',
        params: {
          trail_id: trail.id,
          user_id: user_1.id,
        },
        headers: headers
    end

    it 'User can view the liked amount' do
      expect(response.count).to eq 1
    end
  end
end 