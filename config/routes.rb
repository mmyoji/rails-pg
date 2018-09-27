Rails.application.routes.draw do
  root to: "web/home#index"

  namespace :web do
    constraints subdomain: "www" do
      root to: "home#index"

      resources :users, only: %i(new create)
    end
  end
end
