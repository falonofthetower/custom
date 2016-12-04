class RepliesController < ApplicationController
  def new
    @post = Post.find(params["post_id"])
    @reply = Reply.new
  end

  def create
    @post = Post.find(params["post_id"])
    @reply = @post.replies.build(reply_params)
    @reply.user_id = current_user.id
    if @reply.save
      redirect_to post_path(@post)
      flash[:success] = "Reply created!"
    else
      flash[:danger] = "See Errors!"
      session["reply_errors"] = @reply.errors["content"]
      redirect_to :back
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end
end
