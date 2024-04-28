Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Include routes supported fetching data to IGDB API
  scope :igdb do
    get 'query', to: 'igdb#query'
    get 'search', to: 'igdb#search'
  end

  # Include routes for Games routes
  scope :games do
    get '/', to: 'games#index', as: :games
  end

  # Defines the root path route ("/")
  root 'static#index'
end
