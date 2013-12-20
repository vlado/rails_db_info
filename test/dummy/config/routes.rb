Rails.application.routes.draw do
  if ENV['CATCH_ALL_ROUTE']
    mount_rails_db_info as: 'rails_db_info_engine'
    get '*path' => 'foo#bar'
  end
end
