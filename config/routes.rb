Rails.application.routes.draw do
   root to: "public#homepage"
  devise_for :accounts
  get '/dashboard' => 'accounts#index'
  get 'show/:username' => 'accounts#show', as: :show 
post "follow/account" => "accounts#follow_account", as: :follow_account
  resources :posts do 
resources :likes, only: [:create, :destroy]
resources :comments, only: [:create]
  end
  
 
end
