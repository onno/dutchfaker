require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/shared_fake_examples'

describe DutchFaker::Internet do
  describe ".email" do
    it_should_behave_like "a fake"
    
    before(:each) do
      @fake = DutchFaker::Internet.email
    end
    
    it "should contain exactly one @ character" do
      @fake.scan(/@/).should have(1).thing
    end
    
    it "should end in a valid suffix" do
      suffix = @fake.split('.').last
      DutchFaker::Internet::DOMAIN_SUFFIXES.should include(suffix)
    end
  end
  
  describe ".free_mail" do
    it_should_behave_like "a fake"
    
    before(:each) do
      @fake = DutchFaker::Internet.free_email
    end
    
    it "should contain exactly one @ character" do
      @fake.scan(/@/).should have(1).thing
    end
    
    it "should have a valid free email domain" do
      domain = @fake.split("@").last
      DutchFaker::Internet::FREE_EMAIL_SUFFIXES.should include(domain)
    end
  end
  
  describe ".user_name" do
    it_should_behave_like "a fake"
    
    before(:each) do
      @fake = DutchFaker::Internet.user_name
    end
    
    it "should replace space with a '.' or a'-'" do
      @fake = DutchFaker::Internet.user_name('Piet Janssen')
      @fake.should match(/piet[\._]janssen/)
    end
    
    it "should not contain any spaces" do
      @fake.should_not include(' ')
    end
  end
  
  describe ".domain_name" do
    it_should_behave_like "a fake"
    
    before(:each) do
      @fake = DutchFaker::Internet.domain_name
    end
    
    it "should consist of two parts" do
      @fake.split('.').should have_at_least(2).things
    end
    
    it "should end in a valid suffix" do
      suffix = @fake.split('.').last
      DutchFaker::Internet::DOMAIN_SUFFIXES.should include(suffix)
    end
  end
  
  describe ".domain_word" do
    it_should_behave_like "a fake"
    
    before(:each) do
      @fake = DutchFaker::Internet.domain_word
    end
    
    it "should not contain any spaces" do
      @fake.should_not include(' ')
    end
    
    it "should contain only letters or digits" do
      @fake.should_not match(/[\sW+]/)
    end
  end
  
  describe ".domain_suffix" do
    it_should_behave_like "a fake"
    
    before(:each) do
      @fake = DutchFaker::Internet.domain_suffix
    end
    
    it "should be a valid suffix" do
      DutchFaker::Internet::DOMAIN_SUFFIXES.should include(@fake)
    end
  end
  
  describe ".web_site" do
    it_should_behave_like "a fake"
    
    before(:each) do
      @fake = DutchFaker::Internet.web_site
    end
    
    it "should consist of at least 3 parts" do
      @fake.split('.').should have_at_least(3).things
    end
    
    it "should start with www." do
      @fake.should match(/^www./)
    end
  end
end