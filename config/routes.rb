Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do
      get "/forecast", to: "forecast#index", as: "forecast"
      resources :users, only: [:create]
      post "/sessions", to: "sessions#create", as: "sessions"
      resources :favorites, only: [:create, :index]
      delete "/favorites", to: "favorites#destroy", as: "favorite"
      get "/gifs", to: "gifs#index", as: "gifs"
      get "/backgrounds", to: "backgrounds#index", as: "backgrounds"
    end
  end
end
