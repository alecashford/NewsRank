class FeedWorker
  include Sidekiq::Worker
  def perform(feed_id)
    p "feed #{feed}"
    p "feed_id #{feed_id}"
    feed = Feed.find(feed_id)
   helper = FeedlyHelper.new(feed.feedly_feed_id)
    if helper.stream
      helper.stream["items"].each do |item|
        article = Article.new
        article.add_article(item, feed)
      end
      true
    end
  end
end