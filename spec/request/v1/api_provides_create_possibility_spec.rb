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
        location: 'Roslagen, Stockholm',
        image: {
          type: 'application/jpg',
          encoder: 'name=new_iphone.jpg;base64',
          data: 'iVBORw0KGgoAAAANSUhEUgAABjAAAAOmCAYAAABFYNwHAAAgAElEQVR4XuzdB3gU1cLG8Te9EEgISQi9I71KFbBXbFixN6zfvSiIjSuKInoVFOyIDcWuiKiIol4Q6SBVOtI7IYSWBkm',
          extension: 'jpg'
        }
      },
      headers: headers
    end

    it 'returns a 200 response' do
      expect(response.status).to eq 200
    end

    it 'trail has an image attached' do
      trail = Trail.find_by(title: response.request.params['title'])
      expect(trail.image.attached?).to eq true
    end  
  end

  describe 'gives error if no title' do
    before do
      post '/v1/trails', 
      params: {
        title: '',
        description: 'A nice trail to go for a short day walk when you are north of Sweden.',
        intensity: 1,
        extra: 'Watch out for the trains',
        duration: 90,
        location: 'Roslagen, Stockholm',
        image: {
          type: 'application/jpg',
          encoder: 'name=new_iphone.jpg;base64',
          data: 'iVBORw0KGgoAAAANSUhEUgAABjAAAAOmCAYAAABFYNwHAAAgAElEQVR4XuzdB3gU1cLG8Te9EEgISQi9I71KFbBXbFixN6zfvSiIjSuKInoVFOyIDcWuiKiIol4Q6SBVOtI7IYSWBkm',
          extension: 'jpg'
        }
      },
      headers: headers
    end
    
    it 'returns a 401 response' do
      expect(response.status).to eq 401
    end

    it 'gives error message' do
      expect(response_json['error']).to eq "You are not authorized!"
    end
  end
end