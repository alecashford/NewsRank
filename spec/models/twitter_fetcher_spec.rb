require 'spec_helper'

describe '#fetch' do
  it "makes a connection to the twitter API" do
    twitter = stub_request(:get, "http://cdn.api.twitter.com/1/urls/count.json?url=http://www.brushnewstribune.com/ci_26167090/council-receives-request-revisit-marijuana-moratorium").to_return(status: 200, body: "stubbed response", headers: {})
    client = GetScores::TwitterFetcher.new("http://www.brushnewstribune.com/ci_26167090/council-receives-request-revisit-marijuana-moratorium")
    client.fetch
    expect(twitter).to have_been_requested
  end

end

describe '#count' do
  # it "returns the correct count from Twitter" do
  #   twitter = stub_request(:get, "http://cdn.api.twitter.com/1/urls/count.json?url=http://www.brushnewstribune.com/ci_26167090/council-receives-request-revisit-marijuana-moratorium").to_return(status: 200, body: '{"count":18}', headers: {})
  #   client = GetScores::TwitterFetcher.new("http://www.brushnewstribune.com/ci_26167090/council-receives-request-revisit-marijuana-moratorium")
  #   expect(client.count).to eq(18)
  # end

  # it "returns nil if any error from Twitter API" do
  #   twitter = stub_request(:get, "http://cdn.api.twitter.com/1/urls/count.json?url=http://www.brushnewstribune.com/ci_26167090/council-receives-request-revisit-marijuana-moratorium").to_raise(StandardError.new("any error"))
  #   client = GetScores::TwitterFetcher.new("http://www.brushnewstribune.com/ci_26167090/council-receives-request-revisit-marijuana-moratorium")
  # end
end