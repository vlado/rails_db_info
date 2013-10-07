RailsDba::Engine.routes.draw do
  root :to => 'tables#index'
  resources :tables
end
