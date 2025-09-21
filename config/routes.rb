Rails.application.routes.draw do
  root "statics#home"
  devise_for :users, path: "auth", path_names: { sign_in: "login", sign_out: "logout", password: "secret", confirmation: "verification", unlock: "unblock", registration: "register", sign_up: "sign_up" }

  # Resources implementation for Tasks Controller
  resources :tasks do
    collection do
      patch "toggle/:id", to: "tasks#toggle", as: :toggle
    end
  end
  resources :games, only: [ :show, :index ] do
    collection do
      get "search"
      get "preview/:id", to: "games#preview", as: :preview
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
