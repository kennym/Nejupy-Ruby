class ProblemsController < ApplicationController
  respond_to :html, :json

  def show
    @competition = Competition.find(params[:competition_id])
    @problem = @competition.problems.find(params[:id])

    respond_with(@competition, @problem)
  end
end
