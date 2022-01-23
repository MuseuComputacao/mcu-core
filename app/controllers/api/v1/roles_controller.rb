# frozen_string_literal: true

class Api::V1::RolesController < ApplicationController
  before_action :authenticate_api_user!

  def index
    roles = %w[master cataloger editor curator]
    render(json: roles.to_json)
  end
end
