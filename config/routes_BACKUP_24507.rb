Rails.application.routes.draw do
  devise_for :admins
  resources :organizations
<<<<<<< HEAD

  # root to: "pages/show"
=======
  get "/pending", to: "organizations#pending", as: :pending_organizations
  root to: "organizations#index"
  get "/api", to: "api#all"
>>>>>>> e12556bf1c35b5330fc2bc92d7af4548bdd6b88b
end
