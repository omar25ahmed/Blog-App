Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
        resources :likes, only: [:create]
      end
    end
  end
end
