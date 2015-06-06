Rails.application.routes.draw do
  devise_for :admins
  resources :organizations
  get "/pending", to: "organizations#pending"
  root to: "organizations#index"
end
