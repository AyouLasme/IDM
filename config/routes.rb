Rails.application.routes.draw do
  # Routes Devise pour la gestion des utilisateurs
  devise_for :users

  # Page d'accueil
  root to: "home#index"

  # Interface admin via Avo
  mount Avo::Engine, at: '/avo'

  # Namespace pour Avo (administrateurs uniquement)
  namespace :avo do
    get 'welcome', to: 'welcome#index'
  end

  # Interface utilisateur limitée
  namespace :user do
    # Gestion des résidences
    resources :residences, only: [:index, :show] do
      # Réservations pour une résidence entière
      resources :reservations, only: [:new, :create]

      # Réservations pour des pièces spécifiques
      resources :pieces, only: [:show] do
        resources :reservations, only: [:new, :create]
      end
    end

    # Gestion des réservations spécifiques à l'utilisateur connecté
    resources :reservations, only: [:index, :new, :create, :edit, :update, :destroy]

    # Redirection des utilisateurs connectés vers la liste des résidences
    root to: "residences#index"
  end

  # Route de santé pour le monitoring
  get "up" => "rails/health#show", as: :rails_health_check

  # Page d'accueil additionnelle
  get "home/index"
end
