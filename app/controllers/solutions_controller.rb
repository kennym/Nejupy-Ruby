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
    @problem = @competition.problems.find(params[:problem_id])
    @solution = @problem.solution.new

    respond_to do |format|
      if @solution.save
        format.html { redirect_to(@solution, :notice => 'Solution was successfully created.') }
        format.xml  { render :xml => @solution, :status => :created, :location => @solution }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @solution.errors, :status => :unprocessable_entity }
      end
    end
  end

end
