Rails.application.routes.draw do
  devise_for :admins

  get "/pending", to: "organizations#pending", as: :pending_organizations

  get "/organizations/sidebar", to: "organizations#sidebar"
  get "/organizations/:id/change_status", to: "organizations#change_status", as: :change_organization_status
  resources :organizations

  root to: "organizations#index"
end
