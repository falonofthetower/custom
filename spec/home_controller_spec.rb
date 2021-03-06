require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe "GET#index" do
    context "logged in" do
      login_user

      it "returns the home page" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(response).to render_template("home/index")
      end
    end
  end
end
