RSpec.describe 'User Registration', type: :request do
  

  describe 'User inputs valid credentials' do
    before do
      post '/v1/auth',
        params: {
          name: 'User'
          email: 'user@mail.com'
          password: 'password'
          password_confirmation: 'password'
        },
        headers: headers
    end
    
    it 'returns a user and token' do
      expect(repsonse_json['status']).to eq 'success'
    end

    it 'reurns a positive status' do
      expect(repsonse.status).to eq 200
    end
  end

  describe 'non-matching password confirmation' do
    before do
      post '/v1/auth',
        params: {
          name: 'User'
          email: 'user@mail.com'
          password: 'password'
          password_confirmation: 'wrong_password'
        },
        headers: headers
    end

    it 'returns error message' do
      expect(repsonse_json['errors']['password_confirmation']).to eq ["doesn't match Password"]
    end

    it 'return error status' do
      expect(response.status).to eq 422
    end
  end

  
end
