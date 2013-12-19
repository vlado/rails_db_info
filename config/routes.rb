RailsDbInfo::Engine.routes.draw do
  root :to => 'tables#index'
  resources :tables, only: [:index, :show] do
    get 'entries'
  end
end

Rails.application.routes.draw do
  mount_rails_db_info
end
