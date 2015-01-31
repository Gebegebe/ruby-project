Rails.application.routes.draw do
  get 'home/index'
  get 'signup'  => 'users#new'

  resources :games do
    resources :comments
  end
  resources :users

  root 'home#index'
end
