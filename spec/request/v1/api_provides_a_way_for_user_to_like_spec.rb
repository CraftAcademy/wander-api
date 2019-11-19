RSpec.describe 'Like Functionality', type: :request do
  let!(:trail) { create(:trail) }
  let(:newuser) { create(:user) }
  let(:credentials) { newuser.create_new_auth_token }
  let(:header) {{ HTTP_ACCEPT: 'application/json' }.merge!(credentials)}
  
  describe 'User can like a trail' do
    # before do
    #   post 'v1/likes'
    #     params: {
    #       like_id: like.id,
    #     },
    #     headers: headers
    # end
    
    it 'Ouputs status 200' do
      expect(response.status).to eq 200
    end

    it 'Outputs a positive message' do
      expect(response_json).to eq 'This trail I like'
    end
  end

  describe 'User can UnLike a trail' do

    it 'Outputs status 200' do
      expect(response.status).to eq 200      
    end
    
    it 'Outputs a confirmation message' do
      expect(response_json).to eq 'This trail I like no more'
    end    
  end
  
  describe 'User can see what trail they have Liked' do

    
    it 'User can view their liked trails' do
      expect(response.status).to eq 200
    end
    
    it 'Outputs a confirmation message' do
      expect(response_json).to eq 'These be ya trails, Pathfinder'
    end
  end
end