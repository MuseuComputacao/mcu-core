# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:role) }
    it { should validate_length_of(:password).is_at_least(8) }
  end

  describe 'concerns' do
    it '.sorted' do
      expect(User.order('name desc').to_sql).to eq User.sorted('name', 'desc').to_sql
      expect(User.order('name asc').to_sql).to eq User.sorted('name', 'asc').to_sql
    end
  end
end
