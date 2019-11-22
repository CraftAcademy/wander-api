RSpec.describe 'Like Functionality', type: :request do
  let!(:trail) { create(:trail) }
  let(:user_1) { create(:user) }
  let(:user_2) { create(:user) }
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

    it 'Trail likes has 1 like' do
      expect(trail.likes.count).to eq 1
    end

    it 'Trail likes has 2 likes' do
      like = Like.create(user_id: user_2.id, trail_id: trail.id)
      expect(trail.likes.count).to eq 2 
    end
  end
end