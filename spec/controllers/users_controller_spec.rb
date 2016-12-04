require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET show" do
    let(:user) { FactoryGirl.create(:user) }

    it "sets the user" do
      get :show, id: user.id
      expect(assigns(:user)).to eq user
    end
  end
end
