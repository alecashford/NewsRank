module GetScores
  class FacebookFetcher
    def initialize(url)
      @url = url
    end

    def scores
      {
        likes:    fetch[0]["like_count"],
        comments: fetch[0]["comment_count"],
        shares:   fetch[0]["share_count"]
      }
    end

    def fetch
      HTTParty.get("http://api.facebook.com/restserver.php?method=links.getStats&format=json&urls=#{@url}")
    end
  end

  class TwitterFetcher
    def initialize(url)
      @url = url
    end

    def count
      fetch["count"]
    end

    def fetch
      tw_response = HTTParty.get("http://cdn.api.twitter.com/1/urls/count.json?url=#{@url}")
    end
  end

  class RedditFetcher
    attr_reader
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
