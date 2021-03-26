# frozen_string_literal: true

Rails.application.routes.draw do
  # module the controllers without affecting the URI
  # scope module: :v2, constraints: ApiVersion.new('v2') do
  #   resources :todos, only: :index
  # end
  namespace :v2 do
    resources :todos, only: :index
  end
  namespace :v1 do
    resources :todos do
      resources :items
    end
  end
  # namespace the controllers without affecting the URI
  # scope module: :v1, constraints: ApiVersion.new('v1', true) do
  #   resources :todos do
  #     resources :items
  #   end
  # end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
