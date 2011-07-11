class ContestantController < ApplicationController

  def index
    @competition = current_user.competition
    @problems = @competition.problems
  end
end
