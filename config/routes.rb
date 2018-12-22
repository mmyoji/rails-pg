Rails.application.routes.draw do
  # For common users
  scope module: "web" do
    constraints subdomain: "www" do
      root to: "home#index"

      get    "login",  to: "sessions#new",     as: :login
      delete "logout", to: "sessions#destroy", as: :logout

      get "confirmations", to: "confirmations#create", as: :confirmations

      # resources :bookings, only: %i(index edit update destroy)
      resources :sessions, only: %i(create)
      # resources :studios, only: %i(index show) do
      #   scope module: :studios do
      #     resources :bookings, only: %i(new create)
      #   end
      # end
      resources :users, only: %i(new create)

      resource :resend_confirmation_email, only: %i(new create)
      resource :setting, only: %i(edit update)
    end
  end

  # For studio staff
  scope module: "biz" do
    constraints subdomain: "biz" do
      root to: "home#index", as: :biz_root

      # get    "login",  to: "sessions#new",     as: :biz_login
      # delete "logout", to: "sessions#destroy", as: :biz_logout

      # resources :bookings, only: %i(index show)
      # resources :sessions, only: %i(create)
      # resources :staff_members
      # resources :studios do
      #   scope module: :studios do
      #     resources :bookings
      #     resources :rooms
      #   end
      # end

      # resource :company, only: %i(show edit update)
      # resource :setting, only: %i(edit update)
    end
  end

  # For administrator
  scope module: "admin" do
    constraints subdomain: "admin" do
      root to: "home#index", as: :admin_root

      get    "login",  to: "sessions#new",     as: :admin_login
      delete "logout", to: "sessions#destroy", as: :admin_logout

      # resources :admin_users
      resources :companies do
        scope module: :companies do
          resources :studio_members
        end
      end
      resources :sessions, only: %i(create)
    end
  end
end
