class SolutionsController < ApplicationController
  respond_to :html, :xml

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
    debugger
    @problem = @competition.problems.find(params[:problem_id])
    @solution = Solution.new(params[:solution])
    @solution.user = current_user
    @solution.problem = @problem
                             
    respond_to do |format|
      if @solution.save
        format.html { redirect_to(:root, :notice => 'Solution was successfully created.') }
      else
        format.html { redirect_to(:controller => "contestant", :action => "index",
                                  :notice => @solution.errors) }
      end
    end
  end

end
