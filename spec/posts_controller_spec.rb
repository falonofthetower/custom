require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  include Devise::Test::ControllerHelpers
  login_user

  describe "GET new" do
    context "logged in user" do

      it "sets @post" do
        get :new
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(assigns(:post)).to be_instance_of(Post)
      end
    end
  end

  describe "POST create" do

    context "with valid inputs" do
      before do
        post :create, post: {
          title: "Awesome Post",
          content: "The definition of truly awesomeness"
        }
      end

      it "redirects to the show post path" do
        expect(response).to redirect_to post_path(assigns[:post])
      end

      it "creates a new post" do
        expect(Post.count).to eq 1
      end

      it "sets the success flash message" do
        expect(flash[:success]).to be_present
      end
    end

    context "with invalid inputs" do
      before do
        post :create, post: {
          title: "",
          content: "The definition of truly awesomeness"
        }
      end

      it "renders the new page" do
        expect(response).to render_template :new
      end

      it "does not create the post" do
        expect(Post.count).to eq 0
      end

      it "sets the flash danger message" do
        expect(flash[:danger]).to be_present
      end
    end
  end

  describe "GET show" do

    let(:user) { FactoryGirl.create(:user) }
    let(:post) { FactoryGirl.create(:post, user: user) }

    it "sets the post from the given post" do
      get :show, id: post.id
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "GET index" do
    let(:user) { FactoryGirl.create(:user) }
    let(:post) { FactoryGirl.create(:post, user: user) }

    before do
      get :index
    end

    it "retrieves all the posts" do
      expect(assigns(:posts)).to eq([post])
    end
  end
end
