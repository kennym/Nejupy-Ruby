class ContestantController < ApplicationController
  #load_and_authorize_resource :class => ContestantController
  
  def index
    @competition = current_user.competition
    @problems = @competition.problems
  end
end
