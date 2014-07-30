Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  get "articles", to: "articles#index"

  get "feeds", to: "feeds#index"
  post "feeds/create", to: "feeds#create"
  post "feeds/search", to: "feeds#search"
  delete "feeds/delete/:id", to: "feeds#destroy"

  delete "subscriptions/:id", to: "subscriptions#destroy"

  root :to => 'pages#index'

end
