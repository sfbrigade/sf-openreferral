Rails.application.routes.draw do
  devise_for :admins
  resources :organizations
  root to: "organizations#index"
  get "/api", to: "api#all"
end
