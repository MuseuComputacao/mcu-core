# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :routing do
  describe 'routing' do
    it { should route(:get, 'api/items').to(action: :index, format: :json) }
    it { should route(:post, 'api/item').to(action: :create, format: :json) }
  end
end
