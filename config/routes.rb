Bloge::Application.routes.draw do
  resources :setup, only: [:index, :create]

  devise_for :users
  namespace :admin do 
    resources :posts
    root to: 'home#index'
  end
  resources :posts, only: [:index, :show]

  root to: 'posts#index'

end