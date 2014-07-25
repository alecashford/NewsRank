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

subreddits = ['cats', 'dataisbeautiful']

subreddits.each do |subreddit|
  reddit_response = HTTParty.get("http://www.reddit.com/r/#{subreddit}/.json")
  RedditParser.add_scores(reddit_response)
end

RedditParser.print_scores