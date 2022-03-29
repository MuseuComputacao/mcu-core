# frozen_string_literal: true

class User < ActiveRecord::Base
  include Sortable
  include DeviseTokenAuth::Concerns::User

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable

  enum role: {
    master: 'master',
    cataloger: 'cataloger',
    editor: 'editor',
    curator: 'curator'
  }
  validates_presence_of :role

  def self.sort_by
    %w[name role]
  end

  private_class_method :sort_by
end
