class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :subscriptions
  has_many :feeds, through: :subscriptions

  def articles

    articles = []
    feeds.each do |feed|
      # feed.update_feed #replaced with background job
      FeedWorker.perform_async(feed.id)
      articles << feed.articles
    end
    articles.to_json
  end
end