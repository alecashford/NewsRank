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

subreddits = ["Art","AskReddit","askscience","aww","books","creepy","dataisbeautiful","DIY","Documentaries","EarthPorn","explainlikeimfive","Fitness","food","funny","Futurology","gadgets","gaming","GetMotivated","gifs","history","IAmA","InternetIsBeautiful","Jokes","LifeProTips","listentothis","mildlyinteresting","movies","Music","news","nosleep","nottheonion","OldSchoolCool","personalfinance","philosophy","photoshopbattles","pics","science","Showerthoughts","space","sports","television","tifu","todayilearned","TwoXChromosomes","UpliftingNews","videos","worldnews","WritingPrompts"]

subreddits.each do |subreddit|
  reddit_response = HTTParty.get("http://www.reddit.com/r/#{subreddit}/.json")
  RedditParser.add_scores(reddit_response)
end

RedditParser.print_scores