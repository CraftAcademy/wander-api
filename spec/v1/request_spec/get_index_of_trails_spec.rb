RSpec.describe 'GET Trails index' do

  describe 'displays a list of trails' do
    let!(:trails) { 2.times { create(:trail) } }
    
    before do
      get '/v1/trails'
    end

    it 'returns 2 trails' do
      expect(response_json['trails'].count).to eq 2
    end 

    it 'returns data in the correct structure' do
      expected_response = [
        {
          'id'=>Trail.first.id,
          'title'=>Trail.first.title,
          'description'=>Trail.first.description,
          'intensity'=>Trail.first.intensity,
          'duration'=>Trail.first.duration,
          'location'=>Trail.first.location,
          'extra'=>Trail.first.extra,
          'created_at'=>Trail.first.created_at.strftime('%F')
        },
        {
          'id'=>Trail.first.id,
          'title'=>Trail.first.title,
          'description'=>Trail.first.description,
          'intensity'=>Trail.first.intensity,
          'duration'=>Trail.first.duration,
          'location'=>Trail.first.location,
          'extra'=>Trail.first.extra,
          'created_at'=>Trail.last.created_at.strftime('%F')
        }
      ]
    expect(response_json['Trails']).to eq expected_response
    end
  end
end

describe 'returns error if there are no trails' do
  before do
    get '/v1/trails'
  end

  it 'returns error status' do
    expect(response.status).to eq 400
  end

  it 'returns error message' do
    expect(response_json['error_message']).to eq 'No trails here, turn around.'
  end
end