# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :costumes

  resources :admin_costumes
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
