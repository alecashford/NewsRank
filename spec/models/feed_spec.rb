require 'spec_helper'

describe Feed do

  describe "validations" do

    it {should validate_uniqueness_of :feedly_feed_id}
    it {should have_many :subscriptions}
    it {should have_many :users}

  end

  describe '#update_feed' do

    it 'pulls in new articles if fifteen minutes or more has elapsed since the last update' do
      travel_to(Time.now)

      feedly_helper = double
      feedly_helper.should_receive(:last_update) { 16.minutes.ago }
      feedly_helper.should_receive(:add_to_db)

      FeedlyHelper.stub(:new).with("foobar") { feedly_helper }

      Feed.new(feedly_feed_id: "foobar").update_feed
    end

    it 'does not pull in new articles if less than fifteen minutes has elapsed since last update' do
      travel_to(Time.now)

      feedly_helper = double
      feedly_helper.should_receive(:last_update) { 3.minutes.ago }
      feedly_helper.should_not_receive(:add_to_db)

      FeedlyHelper.stub(:new).with("foobar") { feedly_helper }

      Feed.new(feedly_feed_id: "foobar").update_feed
    end

  end

end
