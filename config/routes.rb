Rails.application.routes.draw do
  devise_for :admins

  get "/api/exportformats", to: "api#export_formats"
  get "/api/export/all", to: "api#export_all"
  get "/api/export/:id", to: "api#export_organization", as: :api_export
  get "/pending", to: "organizations#pending", as: :pending_organizations

  get "/organizations/sidebar", to: "organizations#sidebar"
  resources :organizations

  root to: "organizations#index"
end
