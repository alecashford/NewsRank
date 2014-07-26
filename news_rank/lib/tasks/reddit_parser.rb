require 'HTTParty'
require 'csv'

module RedditParser
  @@votes = []
  @@subreddit_list = []

  def self.run(subreddits_file, votes_file)
    self.parse_subreddit_file(subreddits_file)
    self.add_subreddit_data
    self.write_to_csv(votes_file)
  end

  def self.parse_subreddit_file(subreddit_filename)
    CSV.foreach(subreddit_filename) do |row|
      @@subreddit_list << row[0]
    end
    @@subreddit_list
  end

  def self.add_subreddit_data
    @@subreddit_list.each do |subreddit|
      reddit_response = HTTParty.get("http://www.reddit.com/r/#{subreddit}/.json?limit=100")
      self.add_votes(reddit_response)

      after = reddit_response["data"]["after"]
      second_response = HTTParty.get("http://www.reddit.com/r/#{subreddit}/.json?limit=100&after=#{after}")
      self.add_votes(second_response)
    end
  end

  def self.add_votes(subreddit_response)
    if subreddit_response.length>0
      subreddit_response["data"]["children"].each do |post|
        @@votes << [post["data"]["ups"], post["data"]["downs"], post["data"]["num_comments"]]
      end
    end
  end

  def self.write_to_csv(filename)
    CSV.open(filename, "wb") do |csv|
      @@votes.each do |votes|
        csv << votes
      end
    end
  end

end


votes_file = 'lib/tasks/reddit_votes.csv'
subreddit_file = 'lib/tasks/subreddits.csv'

RedditParser.run(subreddit_file, votes_file)

# p RedditParser.parse_subreddit_file(subreddit_file)