# frozen_string_literal: true

class Item < ActiveRecord::Base
  enum status: {
    pending: 'pending',
    enabled: 'enabled',
    disabled: 'disabled',
    under_maintenance: 'under_maintenance'

  }
  validates_presence_of :status, :name, :register_number
end
