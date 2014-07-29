class SubscriptionsController < ApplicationController

  def destroy
    feed = Feed.find(params[:id])
    current_user.feeds.delete(feed)
    head :success
  end

end