class JudgeController < ApplicationController

  def index
    # TODO: Usually CanCan should handle this
    if !current_user.role?("judge")
      flash["warning"] = t(:you_are_not_a_judge)
      redirect_to :root
    end
    
    @competition = current_user.competition
    @problems = @competition.problems
    @contestants = @competition.get_contestants.includes(:solutions)
  end

  # Problem view
  def problems
    @competition = current_user.competition
    @problems = @competition.problems
  end
  
  # Solutions view
  def solutions
    @competition = current_user.competition
    @problems = @competition.problems.includes(:solutions)
  end
  
  def start_competition
    @competition = current_user.competition
    @competition.start
    
    redirect_to :root and return
  end
  
  def finish_competition
    @competition = current_user.competition
    @competition.end
    
    redirect_to :root and return
  end
  
  def reset_competition
    @competition = current_user.competition
    @competition.reset
    
    redirect_to :root and return
  end
  
end
