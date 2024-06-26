::Rails.application.routes.draw do
  namespace :api, format: :json do
    namespace :v1 do
      resources :menus, only: [ :index ]

      resources :restaurants, only: [] do
        resources :orders, only: [ :create ], module: "restaurants"
      end
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
