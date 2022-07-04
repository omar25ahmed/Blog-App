module Api
  module V1
    class CommentsController < Api::V1::BaseController
      
def index
        post = Post.find(params[:post_id])
        comments = post.comments
        render json: comments
      end
      def create
        post = Post.find(params[:post_id])
        comment = current_user.comments.new(comment_params.merge(post: post))
        if comment.save
          render json: {success: true, message: 'Comment added!'}, status: :created
        else
          render json: {success: false, message: 'Comment isn\'t added!'}, status: :unprocessable_entity
        end
      end

      private

      def comment_params
        params.require(:comment).permit(:text)
      end
    end
  end
end
