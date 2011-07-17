require 'spec_helper'

describe Profile do
  it "has a first_name attribute" do
    Profile.respond_to?("first_name").should be_true
  end

  it "has a last_name attribute" do
    Profile.respond_to?("last_name").should be_true
  end

  it "has a birth_date attribute" do
    Profile.respond_to?("birth_date").should be_true
  end
end
