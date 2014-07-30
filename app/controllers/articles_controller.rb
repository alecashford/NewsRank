class ArticlesController < ApplicationController

  def index
    p "current user#{current_user}"
    render json: current_user.articles
  end
end

