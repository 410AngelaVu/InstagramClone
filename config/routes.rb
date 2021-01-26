Rails.application.routes.draw do
  devise_for :accounts
  get '/dashboard' => 'accounts#index'
  get 'show/:username' => 'accounts#show', as: :show 

  resources :posts
  root to: "public#homepage"
end
