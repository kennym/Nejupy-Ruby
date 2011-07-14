require 'spec_helper'

describe ContestantController do
  describe "GET index" do

    context "user role" do
      login_contestant
      
      it "is contestant" do
        get 'index'
        response.should be_success
      end

      it "is not contestant" do
        get 'index'
        response.should_not be_success
      end
    end
  end
end
