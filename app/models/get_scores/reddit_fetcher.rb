module GetScores

  class RedditFetcher
    def initialize(url)
      @url = url
    end

    def fetch
      begin
      response = HTTParty.get("http://www.reddit.com/api/info.json?url=#{@url}")
      rescue
        nil
      end
    end

    def scores
      if fetch
        score = 0
        num_comments = 0
        fetch["data"]["children"].each do |article|
          score += article["data"]["score"]
          num_comments += article["data"]["num_comments"]
        end
      end
      {
        score: score,
        num_comments: num_comments
      }
    end
  end
end
