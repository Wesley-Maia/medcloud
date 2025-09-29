Rails.application.routes.draw do
  # Rotas do Devise (login/logout) - SEM cadastro público
  devise_for :users, skip: [:registrations]

  # Página inicial
  root "home#index"

  # Rotas administrativas
  namespace :admin do
    get "dashboard", to: "dashboard#index"
  end

  # Health check (Rails padrão)
  get "up" => "rails/health#show", as: :rails_health_check
end
