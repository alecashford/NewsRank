require 'spec_helper'

describe FeedsController do
  describe '#index' do
    let(:user) {FactoryGirl.create :user}
    it "returns a json of the current users feeds" do
      controller.stub(:current_user) {user}
      get :index
      expect(response.header["Content-Type"]).to include("application/json")
    end
  end

    describe '#create' do
      let(:user) {FactoryGirl.create :user}
      let(:feed) {FactoryGirl.create :feed}
        it "adds a feed to the current user" do
        controller.stub(:current_user) {user}
        controller.stub(:params).and_return {{:url => "http://www.engadget.com", :feedId => "feed/http://feeds.engadget.com/weblogsinc/engadget"}}
        stub_request(:get, "http://cloud.feedly.com/v3/search/feeds?q=http://www.brushnewstribune.com/ci_26167090/council-receives-request-revisit-marijuana-moratorium").to_return(:status => 200, :body => "", :headers => {})
        stub_request(:get, "http://cloud.feedly.com/v3/search/feeds?q=http://www.engadget.com").to_return(:status => 200, :body => '{"results":[{"facebookUsername":"Engadget","visualUrl":"http://graph.facebook.com/Engadget/picture?width=100&height=100","deliciousTags":["tech","technology","gadgets"],"feedId":"feed/http://www.engadget.com/rss.xml","language":"en","subscribers":395578,"facebookLikes":452489,"title":"Engadget RSS Feed","website":"http://www.engadget.com","description":"Engadget"}]}', :headers => {:content_type => 'application/json'})
        stub_request(:get, "http://cloud.feedly.com/v3/streams/contents?streamId=feed/http://www.engadget.com/rss.xml").to_return(:status => 200, :body => '{"items":[{"id":"vSbjObuspiUUUlHx496XW/WaRBw2NaRdTW1NAiwoLAs=_1478dfe5bc2:4dc38b:2773ec9f","fingerprint":"d1a6a945","originId":"http://www.engadget.com/2014/07/31/apple-content-delivery-network/","title":"Apples new online content network should deliver your files faster","published":1406836380000,"crawled":1406836562882,"alternate":[{"href":"http://www.engadget.com/2014/07/31/apple-content-delivery-network/?ncid=rss_truncated","type":"text/html"}],"author":"Jon Fingas","origin":{"htmlUrl":"http://www.engadget.com","streamId":"feed/http://www.engadget.com/rss.xml","title":"Engadget RSS Feed"},"summary":{"content":"<img src=\"http://o.aolcdn.com/hss/storage/midas/c0bf4685385e9b47b0c60f9d1437f508/200512799/icloud-drive_thumbnail.jpg\"> If youre an iOS or Mac user, your downloads and streams are going to improve in the near future -- if they havent already. Apple has quietly switched on its own content delivery network (CDN), letting it deliver files directly instead of leaning on...","direction":"ltr"},"visual":{"height":368,"width":630,"url":"http://o.aolcdn.com/hss/storage/midas/c0bf4685385e9b47b0c60f9d1437f508/200512799/icloud-drive_thumbnail.jpg","processor":"feedly-nikon-v3.1","contentType":"image/jpeg"},"unread":true,"engagement":82,"engagementRate":1.61}]}', :headers => {:content_type => 'application/json'})
         stub_request(:get, "http://api.facebook.com/restserver.php?format=json&method=links.getStats&urls=http://www.engadget.com/2014/07/31/apple-content-delivery-network/?ncid=rss_truncated").to_return(:status => 200, :body => '[{"url":"http:\/\/www.engadget.com\/2014\/07\/31\/apple-content-delivery-network\/?ncid=rss_truncated","normalized_url":"http:\/\/www.engadget.com\/2014\/07\/31\/apple-content-delivery-network\/?ncid=rss_truncated","share_count":43,"like_count":67,"comment_count":3,"total_count":113,"click_count":0,"comments_fbid":null,"commentsbox_count":0}]', :headers => {:content_type => 'application/json'})
         stub_request(:get, "http://www.reddit.com/api/info.json?url=http://www.engadget.com/2014/07/31/apple-content-delivery-network/?ncid=rss_truncated").to_return(:status => 200, :body => '{"kind": "Listing", "data": {"modhash": "", "children": [], "after": null, "before": null}}', :headers => {:content_type => 'application/json'})
         stub_request(:get, "http://cdn.api.twitter.com/1/urls/count.json?url=http://www.engadget.com/2014/07/31/apple-content-delivery-network/?ncid=rss_truncated").to_return(:status => 200, :body => '{"count":187,"url":"http:\/\/www.engadget.com\/2014\/07\/31\/apple-content-delivery-network\/?ncid=rss_truncated"}', :headers => {:content_type => 'application/json'})

        expect{ post :create }.to change{ Subscription.count }.by(1)
      end
    end

    describe '#destroy' do
      let(:user) {FactoryGirl.create :user}
      let(:feed) {FactoryGirl.create :feed}
      it "removes the association between the current user and the feed" do
        user.feeds << feed
        controller.stub(:current_user) {user}
        expect{ delete :destroy, id: feed.id }.to change{ Subscription.count }.by(-1)
      end
    end

    describe '#search' do
      it "returns a JSON" do
        controller.stub(:params).and_return {{:url => "puppies"}}
        stub_request(:get, "http://cloud.feedly.com/v3/search/feeds?q=puppies").to_return(:status => 200, :body => '{"results":[{"deliciousTags":["dogs","+cute blogs+","animals","pets","fun ||","misc.","entertainment","puppies","cuteness"],"feedId":"feed/http://feeds.feedburner.com/TheDailyPuppy","language":"en","subscribers":2954,"facebookLikes":145898,"twitterFollowers":18439,"title":"The Daily Puppy | Pictures of Puppies","velocity":8.2,"lastUpdated":1406704440000,"website":"http://www.dailypuppy.com/","score":10096.7578125,"estimatedEngagement":822,"description":"Cute new puppy pictures posted every day. Sign up for pictures of puppies delivered daily."}]}', :headers => {:content_type => 'application/json'})

        post :search
        expect(response.header["Content-Type"]).to include("application/json")
      end
    end

    describe '#update_feeds' do
      it "creates factory workers to update the database"
    end

end