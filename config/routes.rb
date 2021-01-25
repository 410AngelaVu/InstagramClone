Rails.application.routes.draw do
  devise_for :accounts
  get '/dashboard' => 'accounts#index'
  resources :posts
  root to: "public#homepage"
end
