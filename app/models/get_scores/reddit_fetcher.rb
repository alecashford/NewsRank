module GetScores

  class RedditFetcher
    def initialize(url)
      @url = url
    end

    def fetch
      response = HTTParty.get("http://www.reddit.com/api/info.json?url=#{@url}")


      raise '' if response.status != 200
    rescue
        nil
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
