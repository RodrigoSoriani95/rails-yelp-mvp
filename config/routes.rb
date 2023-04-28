Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :restaurants, only: %i[index new update create show edit destroy] do
    resources :reviews, only: %i[new create]
  end
  resources :reviews, only: %i[destroy]
end
