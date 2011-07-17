class SolutionsController < ApplicationController
  respond_to :html, :xml, :json

  def show
    @solution = Solution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @solution }
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
    if user.role?("contestant") and !@competition.in_progress?
      flash[:notice] = "You are not allowed to submit solutions while competition not in progress!"
      redirect_to(:root)
    else
      respond_to do |format|
        if @solution.save
          flash[:notice] = "Solution was created successfully!"
          format.html { redirect_to(:root) }
        else
          format.html { redirect_to(:controller => "contestant", :action => "index",
                                    :notice => @solution.errors) }
        end
      end
    end
  end

end
