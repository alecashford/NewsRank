module GetScores
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