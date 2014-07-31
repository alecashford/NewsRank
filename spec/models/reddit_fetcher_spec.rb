require 'spec_helper'
describe GetScores::RedditFetcher do
  describe '#fetch' do
    it "makes a request to the Reddit endpoint" do
      reddit = stub_request(:get, "http://www.reddit.com/api/info.json?url=http://www.brushnewstribune.com/ci_26167090/council-receives-request-revisit-marijuana-moratorium").to_return(status: 200, body: "stubbed response", headers: {})
      client = GetScores::RedditFetcher.new("http://www.brushnewstribune.com/ci_26167090/council-receives-request-revisit-marijuana-moratorium")
      client.fetch
      expect(reddit).to have_been_requested
    end

    it "returns nil if the endpoint raises an error" do
      reddit = stub_request(:get, "http://www.reddit.com/api/info.json?url=http://www.brushnewstribune.com/ci_26167090/council-receives-request-revisit-marijuana-moratorium").to_raise(StandardError.new("any error"))
      client = GetScores::RedditFetcher.new("http://www.brushnewstribune.com/ci_26167090/council-receives-request-revisit-marijuana-moratorium")
      expect(client.fetch).to eq(nil)
    end

  end

  describe '#scores' do
    it "returns a hash of values" do
      reddit = stub_request(:get, "http://www.reddit.com/api/info.json?url=http://www.brushnewstribune.com/ci_26167090/council-receives-request-revisit-marijuana-moratorium").to_return(status: 200, body: '{"data": {"children": [{"data": { "score": 3164, "num_comments": 251}}, {"data": {"score": 21, "num_comments": 0}}, {"data": {"score": 13, "num_comments": 1}}, {"data": {"score": 1, "num_comments": 1}}]}}', headers: {:content_type => 'application/json'})
      client = GetScores::RedditFetcher.new("http://www.brushnewstribune.com/ci_26167090/council-receives-request-revisit-marijuana-moratorium")
      expect(client.scores).to be_a(Hash)
    end

    it "returns the correct score" do
      reddit = stub_request(:get, "http://www.reddit.com/api/info.json?url=http://www.brushnewstribune.com/ci_26167090/council-receives-request-revisit-marijuana-moratorium").to_return(status: 200, body: '{"data": {"children": [{"data": { "score": 3164, "num_comments": 251}}, {"data": {"score": 21, "num_comments": 0}}, {"data": {"score": 13, "num_comments": 1}}, {"data": {"score": 1, "num_comments": 1}}]}}', headers: {:content_type => 'application/json'})
      client = GetScores::RedditFetcher.new("http://www.brushnewstribune.com/ci_26167090/council-receives-request-revisit-marijuana-moratorium")
      expect(client.scores[:score]).to eq(3199)
    end
  end
end