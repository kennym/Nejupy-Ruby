class PassthroughController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    if current_user.role?("contestant")
      redirect_to :controller => "contestant", :action => "index"
    elsif current_user.role?("administrator")
      redirect_to :controller => "admin", :action => "index"
    elsif current_user.role?("judge")
      redirect_to :controller => "judge", action => "index"
    end
  end
end
