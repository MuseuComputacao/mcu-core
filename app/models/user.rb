# frozen_string_literal: true

class User < ActiveRecord::Base
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

  include DeviseTokenAuth::Concerns::User
end
