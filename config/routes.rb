Rails.application.routes.draw do
  resources :user_projects
  resources :artifacts
  as :user do
    match 'user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end

  devise_for :users, :controllers => {
    :registrations => "registrations",
    :registrations => 'confirmations',
    :sessions => 'milia/sessions',
    :passwords => 'milia/passwords',
  }

  devise_for :models

  resources :tenants do
    resources :projects do
      get 'users', on: :member
      put 'add_user', on: :member
    end
  end

  match '/plan/edit' => 'tenants#edit', via: :get, as: :edit_plan

  match '/plan/update' => 'tenants#update', via: [:put, :patch], as: :update_plan
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
