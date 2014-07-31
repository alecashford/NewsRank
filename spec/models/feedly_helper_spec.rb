require 'spec_helper'

describe FeedlyHelper do
  describe '#stream' do
    it "makes a request to the feedly API" do
      client = FeedlyHelper.new("feed/http://feeds.engadget.com/weblogsinc/engadget")
      feedly = stub_request(:get, "http://cloud.feedly.com/v3/streams/contents?streamId=feed/http://feeds.engadget.com/weblogsinc/engadget").to_return(:status => 200, :body => "", :headers => {})
      client.stream
      expect(feedly).to have_been_requested
    end

    it "returns nil if the server responds with an error" do
      client = FeedlyHelper.new("feed/http://feeds.engadget.com/weblogsinc/engadget")
      feedly = stub_request(:get, "http://cloud.feedly.com/v3/streams/contents?streamId=feed/http://feeds.engadget.com/weblogsinc/engadget").to_raise(StandardError.new("any error"))
      expect(client.stream).to eq(nil)
    end
  end

end

