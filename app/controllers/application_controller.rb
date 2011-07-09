class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!
  check_authorization
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
  end

  def index
  end
  
end
