Rails.application.routes.draw do
  get 'home/index'

  resources :games do
    resources :comments
  end

  root 'home#index'
end
