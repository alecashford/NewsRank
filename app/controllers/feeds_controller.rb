require 'open-uri'
require 'awesome_print'

class FeedsController < ApplicationController

  def index
    render json: current_user.feeds
  end

  def create
    finder = FeedlyFinder.new(params[:url])
    result = finder.find
    feed = Feed.find_by_feedly_feed_id(params[:feedId])
    if !feed
      feed = Feed.new
        feed.url = result["results"][0]["website"]
        feed.name = result['results'][0]['title']
        feed.num_subscribers = result['results'][0]['subscribers']
        feed.feedly_feed_id = result['results'][0]['feedId']
        feed.description = result['results'][0]['description']
        if result['results'][0]['deliciousTags']
          feed.topics = result['results'][0]['deliciousTags'].join(',')
        end
      feed.save
    end

    current_user.feeds << feed
    helper = FeedlyHelper.new(feed.feedly_feed_id)
    helper.add_to_db
    head :success
  end

  def destroy
    feed=Feed.find(params[:id])
    feed.destroy
  end

  def search
    search = FeedlyFinder.new(URI::encode(params[:url]))
    result = search.find
    to_return = []
    result["results"].each do |item|
      to_return << {title: item["title"], subscribers: item["subscribers"], feedId: item["feedId"], url: item["website"]}
    end
    render :json => to_return
  end

  def update_feeds
    feeds = current_user.feeds
    feeds.each do |feed|
      p "feed id #{feed.id}"
     FeedWorker.perform_async(feed.id)
    end
    head :success
  end
end
