require 'spec_helper'

describe Profile do
  before { @profile = Profile.new }
  it "has a first_name attribute" do
    @profile.respond_to?("first_name").should be_true
  end

  it "has a last_name attribute" do
    @profile.respond_to?("last_name").should be_true
  end

  it "has a birth_date attribute" do
    @profile.respond_to?("birth_date").should be_true
  end
end
