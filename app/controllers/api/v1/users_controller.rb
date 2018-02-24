module Api
  module V1
    class UsersController < ApplicationController
        def new
          @user = User.new
        end
      
        def create
          @user = User.new(allowed_params)
          if @user.save
            render json: @user, :except=>  [:password_digest, :token_created_at]
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        end
      
        private
      
        def allowed_params
          params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
    end
  end
end