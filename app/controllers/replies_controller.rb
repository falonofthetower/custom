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
      respond_to do |f|
        f.html do
          redirect_to post_path(@post)
          flash[:success] = "Reply created!"
        end

        f.js do
          @new_reply = Reply.new
        end
      end
    else
      respond_to do |f|
        f.html do
          flash[:danger] = "See Errors!"
          session["reply_errors"] = @reply.errors["content"]
          redirect_to :back
        end

        f.js
      end
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end
end
