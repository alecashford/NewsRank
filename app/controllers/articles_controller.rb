class ArticlesController < ApplicationController

  def index
    render json: current_user.articles
  end
end

