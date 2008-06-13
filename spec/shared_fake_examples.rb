require File.dirname(__FILE__) + '/spec_helper'

shared_examples_for "a fake" do
  it { @fake.should_not be_empty }
end