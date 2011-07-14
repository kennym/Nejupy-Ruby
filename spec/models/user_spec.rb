require 'spec_helper'

describe User do
  context "when is a contestant" do
    before {
      @contestant = Factory.create(:contestant)
      @contestant_role = Role.find_by_name("contestant")
    }

    it "should have contestant role" do
      @contestant.role.should == @contestant_role
      @contestant.role?("contestant")
    end
  end

  context "when is an administrator" do
    before {
      @administrator = Factory.create(:administrator)
      @administrator_role = Role.find_by_name("administrator")
    }

    it "should have the administrator role" do
      @administrator.role.should == @administrator_role
      @administrator.role?("administrator")
    end
  end
  
end
