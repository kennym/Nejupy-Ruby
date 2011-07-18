class PassthroughController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    flash.keep
    
    if current_user.role?("contestant")
      redirect_to :controller => "contestant", :action => "index"
    elsif current_user.role?("judge")
      redirect_to :controller => "judge", :action => "index"
    elsif current_user.role?("administrator")
      redirect_to('/admin')
    end
  end
end
