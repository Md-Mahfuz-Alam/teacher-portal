Rails.application.routes.draw do
  resources :students do
    member do
      put :create_edit
    end
  end
  resources :users
  resources :sessions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#new"
end
