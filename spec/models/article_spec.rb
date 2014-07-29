require 'spec_helper'

describe Article do
  let (:article) {FactoryGirl.build(:article)}
  describe "validations" do
    it {should allow_value(1).for(:published)}
    it {should validate_uniqueness_of :canonical_url}

    it "belongs to a feed" do
    test_feed = Feed.create()
    article.feed_id = test_feed.id
    expect(article.feed.id).to eq(test_feed.id)
    end

    describe "#add_article"
      it "adds an article to the database"




  end
end
