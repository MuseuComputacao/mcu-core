# frozen_string_literal: true

require Rails.root.join('lib', 'api_constraints')

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  namespace :api, defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'
    scope module: :v1,
          constraints: ApiConstraints.new(version: 1, default: true) do
      get 'roles', to: 'roles#index'
      get 'users', to: 'user#index'
      delete 'users', to: 'user#destroy'
    end
  end
end
