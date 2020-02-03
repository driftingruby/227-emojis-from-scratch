Rails.application.routes.draw do
  resources :comments do
    resource :emote, only: :show
  end
  root to: 'comments#index'
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
