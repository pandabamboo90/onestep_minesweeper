Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :boards, only: [:index, :show, :new, :create]

  root "boards#new"
end
