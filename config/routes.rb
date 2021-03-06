Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  get "articles", to: "articles#index"

  get "feeds", to: "feeds#index"
  post "feeds/create", to: "feeds#create"
  post "feeds/search", to: "feeds#search"
  get "feeds/update_feeds", to: "feeds#update_feeds"
  delete "feeds/delete/:id", to: "feeds#destroy"

  delete "subscriptions/:id", to: "subscriptions#destroy"

  root :to => 'pages#index'

  get "welcome", to: "pages#welcome"


end
