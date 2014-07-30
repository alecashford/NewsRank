class Feed < ActiveRecord::Base
  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_many :articles
  validates :feedly_feed_id, uniqueness: true

  def update_feed
    helper = FeedlyHelper.new(self.feedly_feed_id)
    if helper.stream
      helper.stream["items"].each do |item|
        article = Article.new
        article.add_article(item, self)
      end
      true
    end
  end

end