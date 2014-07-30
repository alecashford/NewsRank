class Feed < ActiveRecord::Base
  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_many :articles
  validates :feedly_feed_id, uniqueness: true

  def update_feed
    helper = FeedlyHelper.new(self.feedly_feed_id)
    helper.add_to_db #if helper.last_update < 15.minutes.ago
  end

end