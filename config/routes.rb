Rails.application.routes.draw do
  as :user do
    match 'user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end

  devise_for :users, :conntrollers => {
    :registrations => 'milia/registrations',
    :registrations => 'confirmations',
    :sessions => 'milia/sessions',
    :passwords => 'milia/passwords',
  }

  devise_for :models
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
