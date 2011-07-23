require 'spec_helper'

describe ContestantController do
  describe "GET index" do
    login_contestant
    
    it "as contestant" do
      get 'index'
      response.should be_success
    end
  end
end
