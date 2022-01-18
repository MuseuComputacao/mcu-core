# frozen_string_literal: true

class Api::V1::RolesController < ApplicationController
  def index
    roles = %w[master cataloger editor curator]
    render(json: roles.to_json)
  end
end
