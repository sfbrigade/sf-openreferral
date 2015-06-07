Rails.application.routes.draw do
  devise_for :admins
  resources :organizations

  # root to: "pages/show"
end
