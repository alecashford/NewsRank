require 'json'
require 'HTTParty'

class RedditParser
  @@scores = []

  def self.add_scores(subreddit_response)
    subreddit_response["data"]["children"].each do |post|
      @@scores << [post["data"]["ups"], post["data"]["downs"]]
    end
  end

  def self.print_scores
    p @@scores
  end

end

subreddits = ['dataisbeautiful']

subreddits.each do |subreddit|
  reddit_response = HTTParty.get("http://www.reddit.com/r/#{subreddit}/.json?limit=100")
  after = reddit_response["data"]["after"] #marker for last post found to be passed into next request
  second_response = HTTParty.get("http://www.reddit.com/r/#{subreddit}/.json?limit=100&after=#{after}")
  RedditParser.add_scores(reddit_response)
  RedditParser.add_scores(second_response)

end

RedditParser.print_scores


class TwitterParser

end

