Rails.application.routes.draw do
  resources :events, except: :index do
    resources :tickets, only: [:new, :create, :destroy]
  end

  resource :user, only: :destroy do
    get "retire"
  end

  root to: "welcome#index"
  get "/auth/:provider/callback" => "sessions#create"
  get "/logout" => "sessions#destroy", as: :logout

  match "*path" => "application#error404", via: :all
end
