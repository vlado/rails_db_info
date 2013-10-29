RailsDbInfo::Engine.routes.draw do
  root :to => 'tables#index'
  resources :tables, only: [:index, :show] do
    get 'entries'
  end
end
