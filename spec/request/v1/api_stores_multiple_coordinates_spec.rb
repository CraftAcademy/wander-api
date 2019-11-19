RSpec.describe 'Can create trail with multiple coordinates', type: :request do
  let(:newuser) { create(:user) }
  let(:credentials) { newuser.create_new_auth_token}
  let(:headers) {{ HTTP_ACCEPT: "application/json" }.merge!(credentials)}

  describe 'Trail can be created and have multiple coordinates' do
    before do
      post '/v1/trails', 
      params: {
        title: 'Sörmlandsleden trail',
        description: 'A nice trail to go for a short day walk when you are north of Sweden.',
        intensity: 1,
        extra: 'Watch out for the trains',
        duration: 90,
        city: 'Sörmland',
        country: 'Sweden',
        continent: 'Europe',
        image: [{
          type: 'application/jpg',
          encoder: 'name=new_iphone.jpg;base64',
          data: 'iVBORw0KGgoAAAANSUhEUgAABjAAAAOmCAYAAABFYNwHAAAgAElEQVR4XuzdB3gU1cLG8Te9EEgISQi9I71KFbBXbFixN6zfvSiIjSuKInoVFOyIDcWuiKiIol4Q6SBVOtI7IYSWBkm',
          extension: 'jpg'
        }],
        user_id: newuser.id,
        coordinates: [{latitude: 59.291968, longitude: 18.117070}, {latitude: 59.291968, longitude: 18.117070}]
      },
      headers: headers
    end

    it 'returns a 200 response' do
      expect(response.status).to eq 200
    end

    it 'returns successful message' do
      expect(response_json['message']).to eq 'Trail was successfully created'
    end

    it 'contains latitude coordinates' do
      expect(response_json['data']['coordinates'][0]['latitude']).to eq 59.291968
    end

    it 'contains longitude coordinates' do 
     expect(response_json['data']['coordinates'][0]['longitude']).to eq 18.117070
    end
  end 
end