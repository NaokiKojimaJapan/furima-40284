Rails.application.routes.draw do
  devise_for :users
  get 'furima/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "furima#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
