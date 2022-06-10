class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = 'Comment Added!'
    else
      flash[:error] = "Comment isn't added!"
    end
    redirect_to user_post_path(current_user, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
