RSpec.describe V1::TrailsController, type: :request do
  describe 'Create a trail' do
    before do
      post '/v1/trails', 
      params: {
        title: 'Roslagsbanan trail',
        description: 'A nice trail to go for a short day walk when you are north of Sweden.',
        intensity: 1,
        extra: 'Watch out for the trains',
        duration: 90,
        location: 'Roslagen, Stockholm'
      }
    end

    it 'returns a 200 response' do
      expect(response.status).to eq 200
    end
  end

  describe 'gives error if no title' do
    before do
      post '/v1/trails', 
      params: {
        title: nil,
        description: 'A nice trail to go for a short day walk when you are north of Sweden.',
        intensity: 1,
        extra: 'Watch out for the trains',
        duration: 90,
        location: 'Roslagen, Stockholm'
      },
      headers: headers
    end

    it 'returns a 400 response' do
      expect(response.status).to eq 400
    end

    it 'gives error message' do
      expect(response_json['error_message']).to eq 'Please add content to all fields'
    end
  end
end