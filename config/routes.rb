Rails.application.routes.draw do
   root to: "public#homepage"
  devise_for :accounts
  get '/dashboard' => 'accounts#index'
  get 'show/:username' => 'accounts#show', as: :show 
  get 'post/like/:post_id' => 'likes#save_like', as: :like_post
  resources :posts
end
