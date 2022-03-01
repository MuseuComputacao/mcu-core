# frozen_string_literal: true

require 'rails_helper'

# rubocop: disable Metrics/BlockLength
RSpec.describe '/item', type: :request do
  let(:user) { create :user }
  let(:item) { create :item, user: user }

  let(:valid_attributes) { attributes_for :item, user: user }
  let(:invalid_attributes) { attributes_for :invalid_item, user: user }

  let(:valid_headers) { user.create_new_auth_token }

  describe 'GET /index' do
    it 'renders a successful response' do
      get api_items_url, headers: valid_headers, as: :json
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Item' do
        expect do
          post api_item_url,
               params: { item: valid_attributes },
               headers: valid_headers,
               as: :json
        end.to change(Item, :count).by(1)
      end

      it 'renders a JSON response with the new item' do
        post api_item_url,
             params: { item: valid_attributes },
             headers: valid_headers,
             as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Item' do
        expect do
          post api_item_url,
               params: { item: invalid_attributes },
               headers: valid_headers,
               as: :json
        end.to change(Item, :count).by(0)
      end

      it 'renders a JSON response with errors for the new item' do
        post api_item_url,
             params: { item: invalid_attributes },
             headers: valid_headers,
             as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'with user not logged in' do
      it 'does not create a new Item' do
        expect do
          post api_item_url,
               params: { item: valid_attributes },
               headers: {},
               as: :json
        end.to change(Item, :count).by(0)
      end

      it 'renders a JSON response with errors for the new item' do
        post api_item_url,
             params: { item: valid_attributes },
             headers: {},
             as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
