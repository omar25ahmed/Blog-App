class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    return if @post.liked?(current_user)
    @like = @post.likes.new(user: current_user)
    redirect_to user_post_path(current_user, @post) if @like.save
  end
end
