Rails.application.routes.draw do
  devise_for :admins

  get "/api", to: "api#all"
  get "/pending", to: "organizations#pending", as: :pending_organizations

  resources :organizations
end
