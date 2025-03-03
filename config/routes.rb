Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root to: "pages#home"

  get "about", to: "pages#about"

  resources :article, only: [ :show ]
end
