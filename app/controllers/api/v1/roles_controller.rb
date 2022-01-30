# frozen_string_literal: true

module Api
  module V1
    class RolesController < ApplicationController
      before_action :authenticate_api_user!

      def index
        if current_api_user[:role] == 'master'
          roles = %w[master cataloger editor curator]
          render(json: roles.to_json)
        else
          render(json: { message: 'Unaurthorized role' }, status: 401)
        end
      end
    end
  end
end
