require 'spec_helper'

describe PagesController do
    let(:user) { FactoryGirl.create :user }

  describe '#index' do
    it "should return successful response" do
      controller.stub(:current_user) { user }
      get :index
      expect(response.status).to eq(200)
    end

    it "should redirect to login if user is not signed in" do
      controller.stub(:user_signed_in?) {false}
      get :index
      expect(response).to redirect_to('/users/sign_in')
    end
  end

end