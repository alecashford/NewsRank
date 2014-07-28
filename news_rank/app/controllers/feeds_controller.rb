
# CR I would expect this controller to have two methods index and create - the rest goest to the model

class FeedsController < ApplicationController
# CR - your api renders json from all endpoints - I would do that explicitly
# render :json
  def index
    user=current_user
    feeds = user.feeds
    # update articles in feed
  end

  #Currently this leaves the following fields blank:
  # number of subscribers, description, topics

  # CR this needs to be on a feed model - clean up file argument to params [:file]
  def from_opml(file)
    f = File.open(file)
    doc = Nokogiri::XML(f)
    doc.xpath("//outline").each do |x|
      # CR proper naming - what is x? (row)
      unless x['xmlUrl']==nil
        # CR check for feed before creating using the find_or_create_by method from AR
        feed = Feed.new
          feed.url = x['xmlUrl']
          feed.name = x['title']
          feed.feedly_feed_id = "feed/#{x['xmlUrl']}"
          feed.save
          #assumes if not saved, feed already exists
        if !feed.save
          feed = Feed.find_by_feedly_feed_id(feed.feedly_feed_id)
        end
        associate_user(feed)
        helper = FeedlyHelper.new(feed.feedly_feed_id)
        helper.dump
      end
    end
  end

  def from_url
    # CR protect with exception handling.
    finder = FeedlyFinder.new(params[:url])
    result = finder.find
    feed = Feed.new
      feed.url = result["results"][0]["website"]
      feed.name = result['results'][0]['title']
      feed.num_subscribers = result['results'][0]['subscribers']
      feed.feedly_feed_id = result['results'][0]['feedId']
      feed.description = result['results'][0]['description']
      if result['results'][0]['deliciousTags']
        feed.topics = result['results'][0]['deliciousTags'].join(',')
      end
      feed.save
    if !feed.save
      feed = Feed.find_by_feedly_feed_id(feed.feedly_feed_id)
    end
    # CR just do current_user.feeds << feed
    associate_user(feed)
    helper = FeedlyHelper.new(feed.feedly_feed_id)
    helper.dump
    # CR if you are using your rails app as an API there shouldn't be navigation (ie redirect)
    redirect_to '/'
  end
# CR not necessary
  def associate_user(feed)
    user = current_user
    user.feeds << feed
  end

end
