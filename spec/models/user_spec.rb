require 'spec_helper'

describe User do
  it "should have a name" do
    should validate_presence_of(:name)
  end
end
