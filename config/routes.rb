Rails.application.routes.draw do
  get 'service_areas/index'
  get 'electoral_ward/index'
  get 'service_requests/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "service_requests#index"
  resources :service_requests, :about, :electoral_wards, :service_areas
end
