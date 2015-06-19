Rails.application.routes.draw do

  devise_for :users

  root "pages#index"

  resources :links, only: [:show, :new, :create] do
    member do
      post 'vote'
    end
    resources :comments, only: [:create]
  end

end
