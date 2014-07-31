require 'spec_helper'

describe FeedsController do
  describe '#index' do
    let(:user) {FactoryGirl.create :user}
    it "returns a json of the current users feeds" do
      controller.stub(:current_user) {user}
      get :index
      expect(response.header["Content-Type"]).to include("application/json")
    end

    describe '#create' do
    let(:user) {FactoryGirl.create :user}
      it "adds a feed to the current user" do
      controller.stub(:current_user) {user}
      controller.stub(:params).and_return {{:url => "http://www.brushnewstribune.com/ci_26167090/council-receives-request-revisit-marijuana-moratorium"}}
      stub_request(:get, "http://cloud.feedly.com/v3/search/feeds?q=http://www.brushnewstribune.com/ci_26167090/council-receives-request-revisit-marijuana-moratorium").
         to_return(:status => 200, :body => "", :headers => {})
      expect{ post :create }.to change{ Subscription.count }.by(1)
    end
    end

  end

end