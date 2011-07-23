module RequestMacros
  
  def login_contestant
    before(:each) do
      role = Factory.create(:contestant_role)
      sign_in Factory.create(:contestant, :role => role)
    end
  end
  
end
