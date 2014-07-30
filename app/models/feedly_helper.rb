include GetScores

class FeedlyHelper
  BASE_URI = "http://cloud.feedly.com/v3/"
  attr_reader :feed_id
  def initialize(feed_id)
    @feed_id = feed_id
  end

  # This gets the feed metadata
  def metadata
    HTTParty.post("#{BASE_URI}feeds/.mget",
                  headers: {'Content-type' => 'application/json'},
                  body: JSON.dump([@feed_id]))
  end

  # This a helper method
  def stream
    begin
      HTTParty.get("#{BASE_URI}streams/contents?streamId=#{@feed_id}")
    rescue
      return nil
    end
  end

  # This returns an array of articles
  def articles
    self.stream["items"].map do |item|
      item
    end
  end

  # This gets timestamp of the last update of the feed by feedly
  def last_update
    if self.stream
      self.stream["updated"] / 1000
    else
      Time.now.to_i
    end
  end

  # This returns the continuation id to pass to the next stream call, for pagination.
  # This id guarantees that no entry will be duplicated in a stream
  def continuation
    self.stream["continuation"]
  end

  # This will dump the feed content into the databases
  def add_to_db
    if self.stream
      feed = Feed.find_by feedly_feed_id: @feed_id
      self.stream["items"].each do |item|
        article = Article.new
        article.add_article(item, feed)
      end
      true
    end
  end

end
