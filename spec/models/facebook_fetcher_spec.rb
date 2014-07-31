require 'spec_helper'

describe GetScores::FacebookFetcher do
  describe '#fetch' do
    it "makes a request to the Facebook endpoint" do
       body = '[{"url":"http:\/\/www.google.com","normalized_url":"http:\/\/www.google.com\/","share_count":5951740,"like_count":1472862,"comment_count":1785301,"total_count":9209903,"click_count":265614,"comments_fbid":396269740024,"commentsbox_count":884}]'
      facebook = stub_request(:get, "http://api.facebook.com/restserver.php?format=json&method=links.getStats&urls=http://www.google.com").
         to_return(:status => 200, :body => body, :headers => {:content_type => 'application/json'})
      client = GetScores::FacebookFetcher.new("http://www.google.com")
      client.fetch
      expect(facebook).to have_been_requested
    end
  end

  describe '#scores' do
    it "returns a hash of scores" do
      body = '[{"url":"http:\/\/www.google.com","normalized_url":"http:\/\/www.google.com\/","share_count":5951740,"like_count":1472862,"comment_count":1785301,"total_count":9209903,"click_count":265614,"comments_fbid":396269740024,"commentsbox_count":884}]'
      facebook = stub_request(:get, "http://api.facebook.com/restserver.php?format=json&method=links.getStats&urls=http://www.google.com").
         to_return(:status => 200, :body => body, :headers => {:content_type => 'application/json'})
      client = GetScores::FacebookFetcher.new("http://www.google.com")
      expect(client.scores).to be_a(Hash)
    end

    it "has the correct value for the like count" do
      body = '[{"url":"http:\/\/www.google.com","normalized_url":"http:\/\/www.google.com\/","share_count":5951740,"like_count":1472862,"comment_count":1785301,"total_count":9209903,"click_count":265614,"comments_fbid":396269740024,"commentsbox_count":884}]'
      stub_request(:get, "http://api.facebook.com/restserver.php?format=json&method=links.getStats&urls=http://www.google.com").
         to_return(:status => 200, :body => body, :headers => {:content_type => 'application/json'})
      client = GetScores::FacebookFetcher.new("http://www.google.com")
      expect(client.scores[:likes]).to eq(1472862)
    end

  end
end