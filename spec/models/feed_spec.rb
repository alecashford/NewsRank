require 'spec_helper'

describe Feed do
  let(:feed) { FactoryGirl.build(:feed) }
  it {should validate_uniqueness_of :feedly_feed_id}

  describe '#update_feed' do
   let(:feed) { FactoryGirl.build(:feed) }
   it "adds articles to the database from the feed" do
    stub_request(:get, "http://cloud.feedly.com/v3/streams/contents?streamId=feed/http://feeds.engadget.com/weblogsinc/engadget").to_return(:status => 200, :body => '{"items":[{"title":"Office for iPad updated with PDF export, third-party fonts and video playback support","published":1406841600000,"crawled":1406842575013,"alternate":[{"href":"http://www.engadget.com/2014/07/31/office-for-ipad-updated/?ncid=rss_truncated","type":"text/html"}],"summary":{"content":"<img src=\"http://o.aolcdn.com/hss/storage/adam/d2d4b729d9404c8e27fb492c9ea3c87a/DSC00114_thumbnail.jpg\"> Microsofts iPad version of Office is pretty sleek, but it isnt perfect: it has limited print and export functions and just isnt as robust as its desktop counterpart. Slowly but surely, Redmond is changing that -- today the company announced a few...","direction":"ltr"},"author":"Sean Buckley","origin":{"htmlUrl":"http://www.engadget.com","streamId":"feed/http://feeds.engadget.com/weblogsinc/engadget","title":"Engadget RSS Feed"},"visual":{"height":419,"width":630,"url":"http://o.aolcdn.com/hss/storage/adam/d2d4b729d9404c8e27fb492c9ea3c87a/DSC00114_thumbnail.jpg"}}]}', :headers => {:content_type => 'application/json'})
    stub_request(:get, "http://api.facebook.com/restserver.php?format=json&method=links.getStats&urls=http://www.engadget.com/2014/07/31/office-for-ipad-updated/?ncid=rss_truncated").to_return(:status => 200, :body => '[{"url":"http:\/\/www.engadget.com\/2014\/07\/31\/office-for-ipad-updated\/?ncid=rss_truncated","normalized_url":"http:\/\/www.engadget.com\/2014\/07\/31\/office-for-ipad-updated\/?ncid=rss_truncated","share_count":28,"like_count":31,"comment_count":0,"total_count":59,"click_count":0}]', :headers => {:content_type => 'application/json'})
    stub_request(:get, "http://www.reddit.com/api/info.json?url=http://www.engadget.com/2014/07/31/office-for-ipad-updated/?ncid=rss_truncated").to_return(:status => 200, :body => '{"kind": "Listing", "data": {"modhash": "", "children": [], "after": null, "before": null}}', :headers => {:content_type => 'application/json'})
    stub_request(:get, "http://cdn.api.twitter.com/1/urls/count.json?url=http://www.engadget.com/2014/07/31/office-for-ipad-updated/?ncid=rss_truncated").
         to_return(:status => 200, :body => '{"count":221,"url":"http:\/\/www.engadget.com\/2014\/07\/31\/office-for-ipad-updated\/?ncid=rss_truncated"}', :headers => {:content_type => 'application/json'})
    expect{ feed.update_feed }.to change{Article.count}.by(1)

   end
  end

end