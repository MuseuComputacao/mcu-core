# frozen_string_literal: true

require Rails.root.join('lib', 'api_constraints')

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  # Authentication remains under /api/auth; versioned business routes are
  # grouped below so controllers and route constraints stay aligned.
  namespace :api, defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'
    # v1 is the default implementation. ApiConstraints also accepts an
    # explicit application/vnd.mcu.v1 Accept header.
    scope module: :v1,
          constraints: ApiConstraints.new(version: 1, default: true) do
      get 'roles', to: 'roles#index'
      get 'users', to: 'user#index'
      delete 'users', to: 'user#destroy'
      get 'items', to: 'items#index'
      get 'items/status', to: 'items#items_status'
      post 'item', to: 'items#create'
      get 'item/:id', to: 'items#show'
      put 'item/:id', to: 'items#update'
    end
  end
end
