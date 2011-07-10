class PassthroughController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    path = case current_user.role
      when 'Contestant'
        # TODO: Make this work
    end

    redirect_to :controller => "contestant", :action => "index"
  end
end
