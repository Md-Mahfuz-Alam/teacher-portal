Rails.application.routes.draw do
  resources :students do
    member do
      put :create_edit
    end
  end
  resources :users
  resources :sessions

  root "users#new"
end
