Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  get "articles", to: "articles#get_all_articles"

  post "feeds/from_opml", to: "feeds#from_opml"
  post "feeds/from_url", to: "feeds#from_url"
  delete "feeds/:id", to: "feeds#destroy"

  root :to => 'pages#index'


end
