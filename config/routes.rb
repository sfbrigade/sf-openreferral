Rails.application.routes.draw do
  devise_for :admins
  resources :organizations
  get "/pending", to: "organizations#pending", as: :pending_organizations
  root to: "organizations#index"
end
