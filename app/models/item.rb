# frozen_string_literal: true

class Item < ActiveRecord::Base
  include Sortable

  enum status: {
    pending: 'pending',
    enabled: 'enabled',
    disabled: 'disabled',
    under_maintenance: 'under_maintenance'

  }
  validates_presence_of :status, :name, :register_number

  def self.sort_by
    %w[name created_at]
  end

  private_class_method :sort_by
end
