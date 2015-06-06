Rails.application.routes.draw do
  resources :organizations
  get "/pending", to: "organizations#pending"
end
