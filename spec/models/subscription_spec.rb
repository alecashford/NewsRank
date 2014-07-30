require 'spec_helper'

describe Subscription do
  describe "validations" do
    it {should belong_to(:user)}
    it {should belong_to(:feed)}
  end
end
