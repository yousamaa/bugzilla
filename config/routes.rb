# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :projects
  resources :tickets
  resources :bugs, controller: 'tickets'
  resources :features, controller: 'tickets'
end
