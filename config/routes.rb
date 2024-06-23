Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  resources :pokemons, only: [:index]
  post '/export_pokemons', to: 'pokemons#export_pokemons', as: 'export_pokemons'
  # Defines the root path route ("/")
  root "pokemons#index"
end
