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
      articles << feed.articles
    end
    articles.to_json
  end


end

#methods to split this into pieces:
#get existing articles - if no articles, get one from each feed
#update articles - background job to update database
#long poll from client to refresh the feed from database

