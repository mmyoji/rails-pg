Rails.application.routes.draw do
  scope module: "web" do
    constraints subdomain: "www" do
      root to: "home#index"

      get    "login",  to: "sessions#new",     as: :login
      delete "logout", to: "sessions#destroy", as: :logout

      get "confirmations", to: "confirmations#create", as: :confirmations

      resources :users, only: %i(new create)
      resources :sessions, only: %i(create)

      resource :resend_confirmation_email, only: %i(new create)
    end
  end
end
