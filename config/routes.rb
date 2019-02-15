# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins

  resources :costumes
  root 'costumes#index'

  resources :admin_costumes do
    collection do
      get :fetch
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
