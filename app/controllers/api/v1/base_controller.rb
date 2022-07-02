module Api
  module V1
    class BaseController < ActionController::API
      before_action :authenticate!

      def authenticate!
        @user = User.find_by_email(request.headers["email"])
        return if @user&.valid_password?(request.headers["password"])

        render json: { error: "Invalid email or password" }, status: :unauthorized
      end

      def current_user
        @user
      end
    end
  end
end