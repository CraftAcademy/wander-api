RSpec.describe 'API provides show functionality', type: :request do
    describe 'Return trail succesfully' do
      let!(:newTrail) { create(:trail) }
    
    before do
      get "/v1/trails/#{newTrail.id}"
    end

    it "return id" do      
      expect(response_json['trail']['id']).to eq newTrail.id
    end

    it "return title" do      
      expect(response_json['trail']['title']).to eq newTrail.title
    end

    it "return description" do      
      expect(response_json['trail']['description']).to eq newTrail.description
    end

    it "return intensity" do      
      expect(response_json['trail']['intensity']).to eq newTrail.intensity
    end
    
    it "return extra" do      
      expect(response_json['trail']['extra']).to eq newTrail.extra
    end

    it "return duration" do      
      expect(response_json['trail']['duration']).to eq newTrail.duration
    end

    it "return country" do
      expect(response_json['trail']['country']).to eq newTrail.country
    end

    it "return city" do
      expect(response_json['trail']['city']).to eq newTrail.city
    end
    
    it "return continent" do
      expect(response_json['trail']['continent']).to eq newTrail.continent
    end

    it "return user_id" do
      expect(response_json['trail']['user_id']).to eq newTrail.user_id
    end

    it "return coordinates" do
      expect(response_json['trail']['coordinates']).to eq []
    end

    it 'returns a positive response status' do
      expect(response.status).to eq 200
    end
  end

  describe 'Returns no trail' do
    let!(:trail) {create(:trail)}

    before do
      get '/v1/trails/1'
    end

    it 'Returns error status' do
      expect(response.status).to eq 400
    end
    
    it 'Returns error message' do
      expect(response_json['error_message']).to eq 'There is no trail here go back.'
    end
  end
end