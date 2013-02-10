require File.dirname(__FILE__) + '/../spec_helper'

describe PageRequest do
  it "should be valid" do
    PageRequest.new.should be_valid
  end
end
