class ContestantController < ApplicationController
  #load_and_authorize_resource :class => ContestantController

  def index
    if !current_user.role?("contestant")
      flash["warning"] = t(:you_are_not_a_contestant)
      redirect_to :root
    end
    @competition = current_user.competition
    @problems = @competition.problems
  end
  
  def show
    if !current_user.role?("judge")
      flash["warning"] = t(:you_are_not_a_judge)
      redirect_to :root
    end
    @competition = current_user.competition
    @contestant = User.find_by_id(params[:id])
  end
end
