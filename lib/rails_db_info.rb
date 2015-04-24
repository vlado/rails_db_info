module RailsDbInfo
  # Custom require relative that work with older rubies also
  def self.require_relative(path)
    full_path = File.expand_path(path, File.dirname(__FILE__))
    Kernel.require(full_path)
  end
end

require "rails_db_info/engine"
RailsDbInfo.require_relative("rails/routes")

