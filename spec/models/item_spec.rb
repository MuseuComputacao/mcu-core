# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:register_number) }
  end

  describe 'concerns' do
    it '.sorted' do
      expect(Item.order('created_at desc').to_sql).to eq Item.sorted('created_at', 'desc').to_sql
      expect(Item.order('created_at asc').to_sql).to eq Item.sorted('created_at', 'asc').to_sql
    end
  end
end
