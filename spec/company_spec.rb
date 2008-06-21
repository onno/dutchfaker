require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/shared_fake_examples'

describe DutchFaker::Company do
  describe ".name" do
    it_should_behave_like "a fake"
    
    before(:each) do
      @fake = DutchFaker::Company.name
    end
  end
  
  describe ".suffix" do
    it_should_behave_like "a fake"
    
    before(:each) do
      @fake = DutchFaker::Company.suffix
    end
    
    it "should be a valid suffix" do
      DutchFaker::Company::SUFFIXES.should include(@fake)
    end
  end
end