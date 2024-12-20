Rails.application.routes.draw do
  devise_for :users
  get "home/index"
  mount Avo::Engine, at: '/avo'

  root to: "home#index"

  # Route pour la page de bienvenue dans le namespace :avo
    # Redirige /avo vers la page d'accueil personnalisée
  # Route pour la page d'accueil personnalisée
  namespace :avo do
    get 'welcome', to: 'welcome#index'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
