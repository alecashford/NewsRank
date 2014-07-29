require 'spec_helper'


describe SubscriptionsController do
  describe '#destroy' do
    let(:feed) { FactoryGirl.create :feed }
    let(:user) { FactoryGirl.create :user }
    it 'deletes a subscription' do
      controller.stub(:current_user) { user }
      user.feeds << feed
      expect{ delete :destroy, :id => feed.id }.to change{Subscription.count}.by(-1)
    end
  end
end