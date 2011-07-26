require 'spec_helper'

describe Team do
  def valid_team_attributes
    { :name => "NYC Programmers" }
  end

  before(:each) do
    @team = Team.new
  end
  
  it "must have a name" do
    @team.should_not be_valid
    @team.attributes = valid_team_attributes
    @team.should be_valid
  end
end
