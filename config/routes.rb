Rails.application.routes.draw do
  devise_for :doctors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "landing_page#index"
  namespace :admin do
    resource :dashboard, only: [:show]
    resources :doctors
    resources :hospitals
    resources :patients
    resources :appointments
  end

  namespace :doctors do
    resource :dashboard, only: [:show]
    resources :doctors
    resources :appointments
  end
end
