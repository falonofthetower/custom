class RepliesController < ApplicationController
  def new
    @post = Post.find(params["post_id"])
    @reply = Reply.new
  end

  def create
    @post = Post.find(params["post_id"])
    @reply = Reply.new(reply_params)
    @reply.post_id = @post.id
    @reply.user_id = current_user.id
    if @reply.save
      redirect_to post_path(@post)
      flash[:success] = "Reply created!"
    else
      flash.now[:danger] = "See Errors!"
      render :new
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end
end
