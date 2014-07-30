module GetScores
  class TwitterFetcher
    def initialize(url)
      @url = url
    end

    def count
      if fetch
      fetch["count"]
    end

    def fetch
      tw_response = HTTParty.get("http://cdn.api.twitter.com/1/urls/count.json?url=#{@url}")
    rescue
      nil
    end
  end
end