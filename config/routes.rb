Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :trails, only: [:index]
  end
end
