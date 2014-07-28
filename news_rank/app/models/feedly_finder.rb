class FeedlyFinder
  def initialize(search)
    @search = search
  end

  def find
    begin
      HTTParty.get("http://cloud.feedly.com/v3/search/feeds?q=#{@search}")
    rescue
      # CR - this is REALLY bad - remove silent fails!
      #something here if not successful
    end
  end
# CR - verify if you are using this method - if not delete - if so refactor
  def results
    results = []
    self.find["results"].each do |feed|
      feed_hash = {}
      feed_hash["title"] = feed["title"]
      feed_hash['visualUrl'] = feed['visualUrl']
      feed_hash['subscribers'] = feed['subscribers']
      feed_hash['description'] = feed['description']
      feed_hash['feedId'] = feed['feedId']
      feed_hash['topics'] = feed['deliciousTags']
      results << feed_hash
    end
    results
  end
end


