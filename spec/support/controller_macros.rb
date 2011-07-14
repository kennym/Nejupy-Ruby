module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in Factory.create(:administrator)
    end
  end

  def login_contestant
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in Factory.create(:contestant)
      # @user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
    end
  end
  
end
