Rails.application.routes.draw do
  scope module: "web" do
    constraints subdomain: "www" do
      root to: "home#index"

      resources :users, only: %i(new create)
    end
  end
end
