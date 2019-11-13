RSpec.describe 'User Registration', type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'User inputs valid credentials' do

    before do
      post '/auth',
        params: {
          name: 'User',
          email: 'user@mail.com',
          password: 'password',
          password_confirmation: 'password'
        },
        headers: headers
    end
    
    it 'returns a user and token' do
      expect(response_json['status']).to eq 'success'
    end

    it 'reurns a positive status' do
      expect(response.status).to eq 200
    end
  end

  describe 'non-matching password confirmation' do

    before do
      post '/auth',
        params: {
          name: 'User',
          email: 'user@mail.com',
          password: 'password',
          password_confirmation: 'wrong_password'
        },
        headers: headers
    end

    it 'returns an error message' do
      expect(response_json['errors']['password_confirmation']).to eq ["doesn't match Password"]
    end

    it 'return error status' do
      expect(response.status).to eq 422
    end
  end

  describe 'user inputs an invalid email' do
    
    before do
      post '/auth',
        params: {
          name: 'user_2',
          email: 'user@mail',
          password: 'password',
          password_confirmation: 'password'
        },
        headers: headers
    end

    it 'returns an error message' do
      expect(response_json['errors']['email']).to eq ['is not an email']
    end

    it 'returns an error status' do
      expect(response.status).to eq 422
    end
  end
    
  describe 'User inputs an already registered email' do

    before do
      create(:user,
              name: 'user',
              email: 'user@mail.com',
              password: 'password',
              password_confirmation: 'password'
            )

      post '/auth',
        params: {
          name: 'user_1',
          email: 'user@mail.com',
          password: 'password',
          password_confirmation: 'password'
        },
        headers: headers
    end

    it 'returns an error message' do
      expect(response_json['errors']['email']).to eq ['has already been taken']
    end

    it 'returns an error status' do
      expect(response.status).to eq 422
    end
  end
end