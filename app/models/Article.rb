class Article < ActiveRecord::Base
  belongs_to :feed
  validates :canonical_url, uniqueness: true

  def add_article(item, feed)
    self.title = item["title"]
    self.feed_id = feed.id
     self.feedly_id = item["origin"]["streamId"] # feedly feed/stream ID
     self.published = item["published"]
     self.author = item["author"]
     self.canonical_url = item["alternate"][0]["href"] # permalink
     self.summary = item["summary"]["content"] # this is HTML
     self.site_url = item["origin"]["htmlUrl"]
     if item["visual"]
       self.visual_url = item["visual"]["url"]
       self.visual_height = item["visual"]["height"]
       self.visual_width = item["visual"]["width"]
     end
     self.twitter_count = GetScores::TwitterFetcher.new(self.canonical_url).count
        reddit_scores = GetScores::RedditFetcher.new(self.canonical_url)
        self.reddit_score = reddit_scores.score
        self.reddit_comment_count = reddit_scores.num_comments
        fb_scores = GetScores::FacebookFetcher.new(self.canonical_url).scores
        self.fb_share_count = fb_scores[self.canonical_url][:shares]
        self.fb_like_count = fb_scores[self.canonical_url][:likes]
        self.fb_comment_count = fb_scores[self.canonical_url][:comments]

     self.save
end

end
