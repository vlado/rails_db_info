module ActionDispatch::Routing
  class Mapper
    # Includes mount_rails_db_info method for routes. This method is responsible to
    # generate all needed routes for rails_db_info
    def mount_rails_db_info(options = {})
      mount RailsDbInfo::Engine => "/rails/info/db", :as => options[:as] || 'rails_db_info'
    end
  end
end
