class ArticlesController < ApplicationController

# CR - restful is def index
  def get_all_articles
    render json: current_user.articles
  end
end

