# frozen_string_literal: true

module Api
  module V1
    class ItemsController < ApplicationController
      before_action :authenticate_api_user!

      # rubocop:disable Metrics/AbcSize
      def create # rubocop:disable Metrics/MethodLength
        if current_api_user[:role].include?('editor')
          render(json: { message: 'Unaurthorized role' }, status: 401)
        else
          @item = Item.new(allowed_params)

          @item.status = 'pending'
          @item.register_number = "#{Time.now}-#{allowed_params[:name]}"
          @item.cataloged_by = current_api_user[:name]
          @item.last_change_by = current_api_user[:name]

          if @item.save
            render(json: { message: 'Item create with sucess' }, status: 201)
          else
            render(json: @item.errors, status: :unprocessable_entity)
          end
        end
      end
      # rubocop:enable Metrics/AbcSize

      def index
        render(json: Item.all, status: 200)
      end

      def allowed_params # rubocop:disable  Metrics/MethodLength
        params.require(:item).permit(
          :name,
          :id_photo,
          :description,
          :material,
          :reference_measures,
          :release_date,
          :publication_date,
          :conservation_state,
          :conservation_description,
          :recommendations,
          :general_observations,
          :origin,
          :country,
          :donor_by,
          :donation_date,
          :localization
        )
      end
    end
  end
end
