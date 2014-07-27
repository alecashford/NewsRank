class PagesController < ApplicationController

  def index
    #Must run rails --port 8080
  end

  def auth
    redirect_to "https://cloud.feedly.com/v3/auth/auth?response_type=code&client_id=feedly&redirect_uri=http://localhost:8080&scope=https://cloud.feedly.com/subscriptions"
  end

  def authorized
    puts params[:code]
    HTTParty.post("https://cloud.feedly.com/v3/auth/token?#{params[:code]}")
  end

end