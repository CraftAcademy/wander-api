RSpec.describe 'User Registration', type: :request do
  

  describe 'User inputs valid credentials' do
    
    it 'returns a user and token' do
      expect(repsonse_json['status']).to eq 'success'
    end

    it 'reurns a positive status' do
      expect(repsonse.status).to eq 200
    end
  end

end
