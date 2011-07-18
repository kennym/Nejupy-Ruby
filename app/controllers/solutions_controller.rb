class SolutionsController < ApplicationController
  respond_to :html, :xml, :json

  def show
    @competition = Solution.find(params[:competition_id])
    @solution = Solution.find(params[:id])

    respond_to do |format|
      format.json { render :json => @solution.to_json }
      format.html
    end
  end

  def new
    @competition = Competition.find(params[:competition_id])
    @problem = @competition.problems.find(params[:problem_id])
    @solution = @problem.solution.new

    respond_with(@competition, @problem, @solution)
  end

  def create
    @competition = Competition.find(params[:competition_id])

    @problem = @competition.problems.find(params[:problem_id])
    @solution = Solution.new(params[:solution])
    @solution.user = current_user
    @solution.problem = @problem
                             
    user = current_user
    if user.role?("contestant") and @competition.not_started?
      flash[:notice] = "You are not allowed to submit solutions before competition has started!"
      redirect_to(:root)
    elsif user.role?("contestant") and @competition.finished?
      flash[:notice] = "You are not more allowed to submit solutions!"
      redirect_to(:root)
    else
      if user.role?("contestant") and !@problem.get_solution_for(user).nil?
        flash[:notice] = "You cannot submit two solutions to a problem!"
        redirect_to(:root)
      end
      respond_to do |format|
        if @solution.save
          flash[:notice] = "Solution was created successfully!"
          format.html { redirect_to(:root) }
        else
          flash[:error] = @solution.errors
          format.html { redirect_to(:root) }
        end
      end
    end
  end

end
