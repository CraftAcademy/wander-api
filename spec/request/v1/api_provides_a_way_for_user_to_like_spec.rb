RSpec.describe 'Like Functionality', type: :request do
  let!(:trail) { create(:trail) }
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) {{ HTTP_ACCEPT: "application/json" }.merge!(credentials)}

  describe 'User can like a trail' do
    before do
      post '/v1/likes/',
        params: {
          trail_id: trail.id,
          user_id: user.id,
        },
        headers: headers
       
    end

    it 'Gives status 200' do
      binding.pry

      expect(response.status).to eq 200
    end
  end

  describe 'User can UnLike a trail' do

    it 'Gives status 200' do
      expect(response.status).to eq 200      
    end
  end

  describe 'Visible like amount' do


    it 'User can view the liked amount' do
      expect(response.count).to eq 2
      expect(response).count.to eq 2
    end
  end
end 