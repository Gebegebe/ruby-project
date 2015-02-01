Rails.application.routes.draw do
  get 'sessions/new'

  get 'home/index'
  get 'signup'  => 'users#new'
  get  'login'   => 'sessions#new'
  post  'login'   => 'sessions#create'
  delete  'logout'  => 'sessions#destroy'

  get 'rent/:id' => 'games#rent' , as: "rent"
  get 'unrent/:id' => 'games#unrent', as: "unrent"

  resources :games do
    resources :comments
  end
  resources :users

  root 'home#index'
end
