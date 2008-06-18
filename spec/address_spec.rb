require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/shared_fake_examples'

describe DutchFaker::Address do
  describe ".address" do
    before(:each) do
      @fake = DutchFaker::Address.address
    end
    
    def city
      DutchFaker::Address::CITIES.find { |city| city[0] == @fake[:city] }
    end
    it "should not be null" do
      @fake.should_not be_empty
    end
    
    it "should have a street address" do
      @fake[:street_address].should match(/\w+\s\d{1,3}/)
    end
    
    it "should have a postal code" do
      @fake[:postal_code].should match(/\d{4}[A-Z]{2}/)
    end
    
    it "should have a postal code that is valid for the city" do
      postal_digits = city[2]
      @fake[:postal_code].should match(/^#{postal_digits}/)
    end

    it "should should have a city" do
      @fake[:city].should_not be_empty
    end
    
    it "should have a phone number" do
      @fake[:phone_number].should match(/\d{3,5}\s\d{5,7}/)
    end
    
    it "should have an area code that is valid for the city" do
      area_code = city[1]
      @fake[:phone_number].should match(/^#{area_code}\s/)
    end
  end
  
  describe ".city" do
    it_should_behave_like "a fake"
    
    before(:each) do
      @fake = DutchFaker::Address.city
    end
    
    it "should be a valid city" do
      cities = DutchFaker::Address::CITIES.map { |city| city[0] }
      cities.should include(@fake)
    end
  end
  
  describe ".phone_number" do
    it_should_behave_like "a fake"
    
    before(:each) do
      @fake = DutchFaker::Address.phone_number
    end
    
    it "should be 11 characters long" do
      @fake.length.should == 11
    end
    
    it "should only contain digits" do
      @fake.should match(/[\d\s]+/)
    end
    
    it "should be a valid Dutch phone number" do
      @fake.should match(/\d{3,5}\s\d{5,7}/)
    end
  end
  
  describe ".street_address" do
    it_should_behave_like "a fake"
    
    before(:each) do
      @fake = DutchFaker::Address.street_address
    end
    
    it "should be a street name followed by a number" do
      @fake.should match(/\w+\s\d{1,3}/)
    end
  end
  
  describe ".street_name" do
    it_should_behave_like "a fake"
    
    before(:each) do
      @fake = DutchFaker::Address.street_name
    end
    
    it "should end in a valid suffix" do
      suffixes = DutchFaker::Address::STREET_SUFFIX.uniq.join("|")
      @fake.should match(/[#{suffixes}]$/) 
    end
  end
  
  describe ".postal_code" do
    it_should_behave_like "a fake"
    
    before(:each) do
      @fake = DutchFaker::Address.postal_code
    end
    
    it "should be 6 characters long" do
      @fake.length.should == 6
    end
    
    it "should be 4 digits followed by 2 letters" do
      @fake.should match(/\d{4}[A-Z]{2}/)
    end
  end
end