# frozen_string_literal: true

module Api
  module V1
    class UserController < ApplicationController
      before_action :authenticate_api_user!

      def index
        if current_api_user[:role] == 'master'
          @users = User.all
          render json: @users
        else
          render(json: { message: 'Unaurthorized role' }, status: 401)
        end
      end

      def destroy
        if current_api_user[:role] == 'master'
          @user = User.find(params[:id])
          @user.destroy
          render(json: { message: 'User was delete with success' }, status: 200)
        else
          render(json: { message: 'Unaurthorized role' }, status: 401)
        end
      end
    end
  end
end
