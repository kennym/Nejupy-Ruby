class SolutionsController < ApplicationController
  respond_to :html, :json, :js

  def show
    @competition = Competition.find(params[:competition_id])
    @problem = @competition.problems.find(params[:problem_id])
    @solution = Solution.find(params[:id])
    @detail = @solution.solution_detail
    @contestant = @solution.user

    respond_to do |format|
      format.js
      format.html
    end
  end

  def edit
    @competition = Competition.find(params[:competition_id])
    @problem = @competition.problems.find(params[:problem_id])
    @solution = Solution.find(params[:id])

    respond_with(@competition, @problem, @solution, :layout => request.xhr?)
  end

  def new
    @competition = Competition.find(params[:competition_id])
    @problem = @competition.problems.find(params[:problem_id])
    @solution = @problem.solution.new

    respond_with(@competition, @problem, @solution)
  end

  def update
    @competition = Competition.find(params[:competition_id])
    @problem = @competition.problems.find(params[:problem_id])
    @solution = @problem.solutions.find(params[:id])

    user = current_user
    if user.role?("contestant") and @competition.not_started?
      flash[:notice] = "You are not allowed to update solutions before competition has started!"
      redirect_to(:root)
    elsif user.role?("contestant") and @competition.finished?
      flash[:notice] = "You are not more allowed to update solutions!"
      redirect_to(:root)
    else
      respond_to do |format|
        if @solution.update_attributes(params[:solution])
          flash[:notice] = "Solution was successfully updated!"
          format.html { redirect_to(:root) }
        else
          flash[:error] = @solution.errors
          format.html { redirect_to(:root) }
        end
      end
    end
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
