Rails.application.routes.draw do
  get 'furima/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "furima#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
