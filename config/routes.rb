Rails.application.routes.draw do

  devise_for :users

  root "pages#index"

  resources :links do
    member do
      post 'vote'
    end
    resources :comments
  end

end
