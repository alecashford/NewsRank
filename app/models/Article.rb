class Article < ActiveRecord::Base
  belongs_to :feed
  validates :canonical_url, uniqueness: true

  def add_article(item, feed)
    self.title         = item["title"]
    self.feed_id       = feed.id
    self.feedly_id     = item["origin"]["streamId"] # feedly feed/stream ID
    self.site_url      = item["origin"]["htmlUrl"]
    self.published     = item["published"]
    self.author        = item["author"]
    self.canonical_url = item["alternate"][0]["href"] # permalink
    self.summary       = item["summary"]["content"] # this is HTML

    item["visual"].tap do |visual|
      self.visual_url    = visual["url"]
      self.visual_height = visual["height"]
      self.visual_width  = visual["width"]
    end

    twitter_fetcher  = GetScores::TwitterFetcher.new(canonical_url)
    reddit_fetcher   = GetScores::RedditFetcher.new(canonical_url)
    facebook_fetcher = GetScores::FacebookFetcher.new(canonical_url)
    facebook_scores  = facebook_fetcher.scores
    reddit_scores    = reddit_fetcher.scores

    self.fb_share_count       = facebook_scores[:shares]
    self.fb_like_count        = facebook_scores[:likes]
    self.fb_comment_count     = facebook_scores[:comments]

    self.twitter_count        = twitter_fetcher.count

    self.reddit_score         = reddit_scores[:score]
    self.reddit_comment_count = reddit_scores[:num_comments]

    self.save
  end

end
