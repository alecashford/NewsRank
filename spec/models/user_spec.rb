require 'spec_helper'

  describe User do
    describe "validations" do
      it {should validate_uniqueness_of :email}
      it {should have_many :feeds}
      it {should have_many :subscriptions}
    end

  describe '#articles' do
    user = User.new(email: "test@gmail.com", password: "password")

    it "returns an array of articles as json" do
      user.articles { is_expected.to respond_with_content_type(:json) }
    end

    it "updates the users feeds" do
      feed_one = Feed.new
      user.feeds << feed_one
      feed_one.should_receive(:update_feed)
      user.articles
    end
  end

end

