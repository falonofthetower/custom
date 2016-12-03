require 'rails_helper'

RSpec.describe RepliesController, type: :controller do
  include Devise::Test::ControllerHelpers
  login_user

  describe "GET new" do
    context "logged in" do
      it "renders the new page" do
        post = FactoryGirl.create(:post)
        get :new, { post_id: post }
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(assigns(:reply)).to be_instance_of(Reply)
        expect(response).to render_template 'new'
      end
    end
  end

  describe "POST create" do
    context "with valid inputs" do
      let(:first_post) { FactoryGirl.create(:post) }

      before do
        post :create, post_id: first_post, reply: {
          content: "The definition of truly awesomeness"
        }
      end

      it "redirects to the show post path" do
        expect(response).to redirect_to post_path(first_post)
      end

      it "creates the reply" do
        expect(Reply.count).to eq(1)
      end

      it "sets the created reply belonging to the post" do
        expect(Reply.first.user).to eq(subject.current_user)
      end

      it "sets the creator as the current user" do
        expect(Reply.first.post).to eq(first_post)
      end

      it "sets the success flash message" do
        expect(flash[:success]).to be_present
      end
    end

    context "with invalid inputs" do
      let(:first_post) { FactoryGirl.create(:post) }

      before do
        post :create, post_id: first_post, reply: { content: "" }
      end

      it "renders the new page" do
        expect(response).to render_template :new
      end

      it "does not create the post" do
        expect(Reply.count).to eq 0
      end

      it "sets the flash danger message" do
        expect(flash[:danger]).to be_present
      end
    end
  end
end
