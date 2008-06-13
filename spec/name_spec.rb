require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/shared_fake_examples'

describe DutchFaker::Name do
  describe ".name" do
    it_should_behave_like "a fake"
    
    before(:each) do
      @fake = DutchFaker::Name.name
    end
    
    it "should contain at least two words" do
      @fake.should match(/[\w\.]+\s\w+/)
    end
  end
  
  describe ".first_name" do
    it_should_behave_like "a fake"

    before(:each) do
      @fake = DutchFaker::Name.first_name
    end
    
    it "should be an entry in Faker::Name::FIRST_NAMES" do
      DutchFaker::Name::FIRST_NAMES.should include(@fake)
    end
  end
  
  describe ".last_name" do
    it_should_behave_like "a fake"
    
    before(:each) do
      @fake = DutchFaker::Name.last_name
    end
    
    it "should be an entry in Faker::Name::LAST_NAMES" do
      DutchFaker::Name::LAST_NAMES.should include(@fake)
    end
  end
  
  describe ".prefix" do
    it_should_behave_like "a fake"
    
    before(:each) do
      @fake = DutchFaker::Name.prefix
    end
    
    it "should be a valid prefix" do
      DutchFaker::Name::PREFIXES.should include(@fake)
    end
  end
end