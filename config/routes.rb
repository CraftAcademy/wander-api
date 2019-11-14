Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
  namespace :v1, defaults: { format: :json } do
    resources :trails, only: [:index, :create, :show]
    # resources :trails do
    #   collection do
    #     get :search
    #   end
    # end
      
  end
end