require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/shared_fake_examples'

describe DutchFaker::Address do
  describe ".city" do
    it_should_behave_like "a fake"
    
    before(:each) do
      @fake = DutchFaker::Address.city
    end
    
    it "should be a valid city" do
      fail
    end
  end
end