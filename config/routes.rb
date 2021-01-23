Rails.application.routes.draw do
  devise_for :accounts
  get '/dashboard' => 'accounts#index'
  root to: "public#homepage"
end
