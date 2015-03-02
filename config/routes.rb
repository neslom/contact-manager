Rails.application.routes.draw do
  resources :companies

  resources :email_addresses, :except => [:index, :show]

  resources :phone_numbers, :except => [:index, :show]

  resources :people

  # Auth

  get '/auth/:provider/callback' => 'sessions#create'

  resource :sessions, :only => [:create]

  get "/login" => redirect("/auth/twitter"), as: :login

  delete "/logout" => 'sessions#destroy', as: :logout

  root 'site#index'
end
