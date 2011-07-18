class JudgeController < ApplicationController

  def index
    // TODO: Usually CanCan should handle this
    if !current_user.role?("judge")
      flash["warning"] = "You are not a judge."
      redirect_to :root
    end
    
    @competition = current_user.competition
    @problems = @competition.problems
    @contestants = @competition.get_contestants
  end
  
end
