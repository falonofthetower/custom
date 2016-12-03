module ControllerMacros
  def login_user(set_user=nil)
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = (set_user || FactoryGirl.create(:user))
      sign_in user
    end
  end
end
