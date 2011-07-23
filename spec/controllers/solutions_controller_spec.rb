require 'spec_helper'

describe SolutionsController do

  describe "POST create" do
    context "with user role contestant" do
      before {
        @competition = Factory.create(:competition),
        @user = Factory.create(:contestant, :competition => @competition)
      }

      context "and competition is not in progress" do
        before {
          @competition = Factory.create(:competition)
          @problem = Factory(:problem, :competition => @competition)
        }
        
        it "then it should not save the solution" do
          # TODO
        end
      end
    end
  end
          
  #describe "DELETE destroy" do
  #  it "destroys the requested solution" do
  #    solution = Solution.create! valid_attributes
  #    expect {
  #      delete :destroy, :id => solution.id.to_s
  #    }.to change(Solution, :count).by(-1)
  #  end
  # 
  #  it "redirects to the solutions list" do
  #    solution = Solution.create! valid_attributes
  #    delete :destroy, :id => solution.id.to_s
  #    response.should redirect_to(solutions_url)
  #  end
  #end

end
