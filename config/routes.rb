Rails.application.routes.draw do
  devise_for :accounts
  get '/dashboard' => 'accounts#index'
  get 'profile/:username' => 'accounts#profile', as: :profile
  resources :posts
  root to: "public#homepage"
end
