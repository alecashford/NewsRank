require 'spec_helper'

describe FeedsController do

  describe '#index' do
     let(:user) { FactoryGirl.create :user }
    it "should return a JSON that corresponds to the current users feeds" do
      controller.stub(:current_user) { user }
      expect(controller.current_user).to receive(:feeds)
      get :index
      expect(response.header["Content-Type"]).to include "application/json"
    end
    end


  describe '#create' do
      let(:user) { FactoryGirl.create :user }
      let(:feed) { FactoryGirl.build :feed }
    it "should create a new feed if the feed doesn't exist in the database" do
      controller.stub(:current_user) { user }
      expect{ post :create, :url => feed.url}.to change{Feed.count}.by(1)
    end

    it "should create a subscription between the current user and a feed" do
      controller.stub(:current_user) { user }
      expect{ post :create, :url => feed.url}.to change{Subscription.count}.by(1)
    end

    it "should not create a subscription if the user already has a subscription to the feed" do
      controller.stub(:current_user) { user }
      #need to add a feed to the user - can't do with FactoryGirl build??
    end

  end

  describe '#search' do
    it "should return JSON of feeds" do
      #need to stub out API call HOW?
      expect(response.header["Content-Type"]).to include "application/json"
    end
  end
end

