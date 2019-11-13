RSpec.describe 'Login functionality', type: :request do
  let(:user) { create(:user) }
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'User log in using valid credentials' do
    
    it 'valid credentials return registered user' do
      post '/auth/sign_in', params: { email: user.email,
                                      password: user.password
                                    }, headers: headers

      expected_response = {
        'data' => {
          'id' => user.id, 'uid' => user.email, 'email' => user.email,
          'provider' => 'email', 'name' => user.name, 'nickname' => nil,
          'image' => nil, 'allow_password_change' => false
        }
      }

      expected(response_json).to eq expected_response
    end
  end
  
  describe 'User log in using invalid credentials' do
    
    before do
      post '/auth/sign_in', params: { email: user.email,
                                      password: 'wrong_password'
                                    }, headers: headers
    end

    it 'invalid password returns error message' do
      expect(response_json['errors'])
        .to eq ['Invalid login credentials. Please try again.']
    end

    it 'invalid password returns error status' do
      expect(response.status).to eq 401
    end
    
    before do
      post '/auth/sign_in', params: { email: 'wrong@mail.com',
                                      password: user.password
                                    }, headers: headers
    end

    it 'invalid email returns error message' do
      expect(response_json['errors'])
        .to eq ['Invalid login credentials. Please try again.']
    end
    
    it 'invalid email returns error status' do
      expect(response.status).to eq 401
    end
  end
end