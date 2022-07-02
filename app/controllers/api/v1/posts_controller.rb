module Api
  module V1
    class PostsController < Api::V1::BaseController
      def index
        posts = current_user.posts
        render json: posts
      end
    end
  end
end
