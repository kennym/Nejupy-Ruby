class ProblemsController < ApplicationController
  # GET /competitions/1/problems
  # GET /competitions/1/problems.xml
  def index
    @competition = Competition.find(params[:competition_id])
    @problems = @competition.problems.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @problems }
    end
  end

  # GET /competitions/1/problems/1
  # GET /competitions/1/problems/1.xml
  def show
    @competition = Competition.find(params[:competition_id])
    @problem = @competition.problems.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @problem }
    end
  end

  # GET /competitions/1/problems/new
  # GET /competitions/1/problems/new.xml
  def new
    @competition = Competition.find(params[:competition_id])
    @problem = @competition.problems.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @problem }
    end
  end

  # GET /competition/1/problems/1/edit
  def edit
    @competition = Competition.find(params[:competition_id])
    @problem = @competition.problems.find(params[:id])
  end

  # POST /competitions/1/problems
  # POST /competitions/1/problems.xml
  def create
    @competition = Competition.find(params[:competition_id])
    @problem = @competition.problems.new(params[:problem])

    respond_to do |format|
      if @problem.save
        format.html { redirect_to(@problem, :notice => 'Problem was successfully created.') }
        format.xml  { render :xml => @problem, :status => :created, :location => @problem }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @problem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /competitions/1/problems/1
  # PUT /competitions/1/problems/1.xml
  def update
    @competition = Competition.find(params[:competition_id])
    @problem = @competition.problems.find(params[:id])

    respond_to do |format|
      if @problem.update_attributes(params[:problem])
        format.html { redirect_to(@problem, :notice => 'Problem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @problem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /competitions/1/problems/1
  # DELETE /competitions/1/problems/1.xml
  def destroy
    @competition = Competition.find(params[:competition_id])
    @problem = @competition.problems.find(params[:id])
    @problem.destroy

    respond_to do |format|
      format.html { redirect_to(problems_url) }
      format.xml  { head :ok }
    end
  end
end
