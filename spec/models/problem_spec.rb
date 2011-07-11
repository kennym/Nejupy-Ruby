require 'spec_helper'

describe Problem do
  before do
    @competition = Factory.create(:competition)
    @problem = Problem.new
  end
  
  def valid_problem_attributes
    { :competition_id => @competition,
      :name => "The sum of two numbers",
      :description => "Return the sum of two numbers" }
  end

  it "should be invalid if doesn't belong to a competition" do
    @problem.attributes = valid_problem_attributes.except(:competition_id)
    @problem.valid? == false
  end
  
  it "should be valid if belongs to a competition" do
    @problem.attributes = valid_problem_attributes
    @problem.valid? == true
  end
end
