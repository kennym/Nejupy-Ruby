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
      flash[:notice] = t(:not_allowed_to_update_solutions_before_competition)
      redirect_to(:root)
    elsif user.role?("contestant") and @competition.finished?
      flash[:notice] = t(:you_are_not_more_allowed_to_update_solutions)
      redirect_to(:root)
    else
      respond_to do |format|
        if @solution.update_attributes(params[:solution])
          flash[:notice] = t(:solution_successfully_updated)
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

    @programming_language = params[:programming_language]
    @problem = @competition.problems.find(params[:problem_id])
    @solution = Solution.new(params[:solution])
    @solution.user = current_user
    @solution.problem = @problem
    @solution.programming_language = @programming_language.to_i
                           
    if @programming_language.nil? or @programming_language.empty?
      flash[:error] = t(:please_choose_a_programming_language)
      redirect_to(:root) and return
    end
    ## REFACTOR ME!
    user = current_user
    if user.role?("contestant") and @competition.not_started?
      flash[:error] = t(:cannot_submit_solutions_before_competition)
      redirect_to(:root)
    elsif user.role?("contestant") and @competition.finished?
      flash[:error] = t(:cannot_submit_solutions_after_competition_finish)
      redirect_to(:root)
    else
      if user.role?("contestant") and !@problem.get_solution_for(user).nil?
        flash[:error] = t(:cannot_submit_more_than_one_solution)
        redirect_to(:root)
      end
        
      respond_to do |format|
        if @solution.save
          @solution.get_ideone_data
          flash[:notice] = t(:solution_successfully_created)
          format.html { redirect_to(:root) }
        else
          flash[:error] = @solution.errors
          format.html { redirect_to(:root) }
        end
      end
    end
  end

end
