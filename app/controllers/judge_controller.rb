class JudgeController < ApplicationController

  def index
    @competition = current_user.competition
    @problems = @competition.problems
    @contestants = @competition.get_contestants
  end
  
end
