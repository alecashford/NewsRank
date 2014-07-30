module GetScores
  class FacebookFetcher
    attr_reader :shares, :likes, :comments, :total, :urls, :scores
    def initialize(*urls)
      @urls = urls.join(",")
      begin
        @fb_response = HTTParty.get("http://api.facebook.com/restserver.php?method=links.getStats&format=json&urls=#{@urls}")
      rescue
        return
      end
      @scores = {}
      loop_through_scores
    end

    def total
      @likes + @comments + @shares
    end

    def loop_through_scores
      @fb_response.each do |article|
        url = article["url"]
        likes = article["like_count"]
        comments = article["comment_count"]
        shares = article["share_count"]
        @scores.merge!(url => {:likes => likes, :comments => comments, :shares => shares})
      end
    end
  end

  class TwitterFetcher
    attr_reader :count
    def initialize(url)
      begin
        tw_response = HTTParty.get("http://cdn.api.twitter.com/1/urls/count.json?url=#{url}")
      rescue
        return
      end
      @count = tw_response["count"]
    end
  end

  class RedditFetcher
    attr_reader :score, :num_comments
    def initialize(url)
      begin
        @rd_response = HTTParty.get("http://www.reddit.com/api/info.json?url=#{url}")
      rescue
        return
      end
      @score = 0
      @num_comments = 0
      scrape_scores
    end
    def scrape_scores
      @rd_response["data"]["children"].each do |article|
        @score += article["data"]["score"]
        @num_comments += article["data"]["num_comments"]
      end
    end
  end
end
