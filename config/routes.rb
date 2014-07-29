Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  get "articles", to: "articles#index"

  get "feeds", to: "feeds#index"
  post "feeds/from_opml", to: "feeds#from_opml"
  post "feeds/from_url", to: "feeds#from_url"
  post "feeds/search", to: "feeds#search"
  delete "subscriptions/:id", to: "subscriptions#destroy"

  root :to => 'pages#index'


end
