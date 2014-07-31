require 'spec_helper'

describe Article do
  let (:article) { FactoryGirl.build(:article) }
  describe "validations" do
    it {should allow_value(1).for(:published)}
    it {should validate_uniqueness_of :canonical_url}
    it {should belong_to :feed}
    end

describe "#add_article" do
  article = Article.new
  let(:feed) { FactoryGirl.build(:feed) }
  item = {
                        "id" => "sHSGXxDz2U2mAoLEEsBjC3+jXmO/7KkWNzoP8ntZ0NM=_1478447ede6:274fd24:a1131c96",
               "fingerprint" => "c22554d4",
                  "originId" => "http://www.engadget.com/2014/07/29/playdate-the-last-of-us-remastered/",
                     "title" => "Playdate: We're livestreaming 'The Last of Us: Remastered' on PS4!",
                 "published" => 1406673000000,
                   "crawled" => 1406673612262,
                 "alternate" => [
                 {
                    "href" => "http://feedproxy.google.com/~r/weblogsinc/engadget/~3/Noviv75s6JI/",
                    "type" => "text/html"
                }
            ],
                 "canonical" => [
                 {
                    "href" => "http://www.engadget.com/2014/07/29/playdate-the-last-of-us-remastered/?ncid=rss_truncated",
                    "type" => "text/html"
                }
            ],
                   "summary" => {
                  "content" => "<img src=\"http://o.aolcdn.com/hss/storage/midas/32abb0395abca7ae5a8857c617f17a24/200501809/joel+punches+hunter_thumbnail.jpg\">Welcome, ladygeeks and gentlenerds, to the new era of gaming. The one where you get to watch, and comment, as other people livestream gameplay from next-gen consoles. Because games! They're fun!...",
                "direction" => "ltr"
            },
                    "author" => "Timothy J. Seppala",
                    "origin" => {
                 "htmlUrl" => "http://www.engadget.com",
                "streamId" => "feed/http://feeds.engadget.com/weblogsinc/engadget",
                   "title" => "Engadget RSS Feed"
            },
                    "visual" => {
                        "url" => "http://o.aolcdn.com/hss/storage/midas/32abb0395abca7ae5a8857c617f17a24/200501809/joel+punches+hunter_thumbnail.jpg",
                     "height" => 540,
                      "width" => 960,
                  "processor" => "feedly-nikon-v3.1",
                "contentType" => "image/jpeg"
            },
                    "unread" => true,
                "engagement" => 44,
            "engagementRate" => 0.56
        }

  it "adds an article to the database" do
    stub_request(:get, "http://api.facebook.com/restserver.php?format=json&method=links.getStats&urls=http://feedproxy.google.com/~r/weblogsinc/engadget/~3/Noviv75s6JI/").
         to_return(:status => 200, :body => '[{"url":"http:\/\/feedproxy.google.com\/~r\/weblogsinc\/engadget\/~3\/Noviv75s6JI\/","normalized_url":"http:\/\/feedproxy.google.com\/~r\/weblogsinc\/engadget\/~3\/Noviv75s6JI\/","share_count":39,"like_count":49,"comment_count":6,"total_count":94,"click_count":0,"comments_fbid":null,"commentsbox_count":0}]', :headers => {})
    stub_request(:get, "http://www.reddit.com/api/info.json?url=http://feedproxy.google.com/~r/weblogsinc/engadget/~3/Noviv75s6JI/").
         to_return(:status => 200, :body => '{"kind": "Listing", "data": {"modhash": "", "children": [], "after": null, "before": null}}', :headers => {:content_type => 'application/json'})
    stub_request(:get, "http://cdn.api.twitter.com/1/urls/count.json?url=http://feedproxy.google.com/~r/weblogsinc/engadget/~3/Noviv75s6JI/").
         to_return(:status => 200, :body => '{"count":0,"url":"http:\/\/feedproxy.google.com\/~r\/weblogsinc\/engadget\/~3\/Noviv75s6JI\/"}', :headers => {:content_type => 'application/json'})
      expect{article.add_article(item, feed)}.to change{Article.count}.by(1)
    end

    it "updates the article facebook scores" do
      expect(article.fb_share_count).to be >= 0
    end

  end
end


