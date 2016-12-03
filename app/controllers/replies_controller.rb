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
    @reply.save
    redirect_to post_path(@post)
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end
end
