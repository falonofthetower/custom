class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "Post saved!"
      redirect_to post_path(@post)
    else
      render :new
      flash[:danger] = "Something went horrifyingly wrong"
    end
  end

  def show
  end

  def index
    @posts = Post.all
  end


  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :title)
  end
end
