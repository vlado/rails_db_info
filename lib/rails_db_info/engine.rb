module RailsDbInfo
  class Engine < ::Rails::Engine
    isolate_namespace RailsDbInfo
    config.autoload_paths += Dir["#{config.root}/lib"]
  end
end
