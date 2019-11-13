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
  
end