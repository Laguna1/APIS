# frozen_string_literal: true

Rails.application.routes.draw do
  resources :todos do
    resources :items
  end
end
