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
      flash.now[:danger] = "Something went horrifyingly wrong"
      render :new
    end
  end

  def show
    set_reply
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

  def set_reply
    @reply = Reply.new
    if session["reply_errors"] != nil
      @reply_errors = ErrorProxy.new(session["reply_errors"])
      session["reply_errors"] = nil
    else
      @reply_errors = @reply
    end
  end
end
