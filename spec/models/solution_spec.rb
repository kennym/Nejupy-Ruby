require 'spec_helper'

describe Solution do
  before do
    @solution = Solution.new
    @problem = Factory.create(:problem)
    @user = Factory.create(:user)
  end

  def valid_solution_attributes
    { :problem_id => @problem,
      :source_code => "puts 'hello world'",
      :user => @user}
  end
      
  it "should be invalid if it doesn't have source code" do
    @solution.attributes = valid_solution_attributes.except(:source_code)
    @solution.valid? == false
    @solution.source_code = valid_solution_attributes[:source_code]
    @solution.valid? == true
  end
  
  it "should be invalid if it doesn't belong to a problem" do
    @solution.attributes = valid_solution_attributes.except(:problem_id)
    @solution.valid? == false
    @solution.source_code = valid_solution_attributes[:problem_id]
    @solution.valid? == true
  end
  
  it "should be invalid if it doesn't have a user" do
    @solution.attributes = valid_solution_attributes.except(:user)
    @solution.valid? == false
    @solution.source_code = valid_solution_attributes[:user]
    @solution.valid? == true
  end
end
