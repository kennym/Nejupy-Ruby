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
    @problem.valid?.should be_false
  end
  
  it "should be valid if belongs to a competition" do
    @problem.attributes = valid_problem_attributes
    @problem.valid?.should be_true
  end

  context "which has a solution from a contestant" do
    before do
      @problem = Factory.create(:problem)
      @contestant = Factory.create(:contestant)
      @solution = Solution.create!(:problem => @problem,
                                   :user => @contestant,
                                   :source_code => "puts 'hello, world'")
    end
      
    it "should be solved by contestant" do
      @problem.solved_by?(@contestant).should be_true
    end
  end

  context "which has no solution from the contestant" do
    before do
      @problem = Factory.create(:problem)
      @contestant = Factory.create(:contestant)
    end

    it "should not be solved by participant" do
      @problem.solved_by?(@contestant).should be_false
    end
  end
end
