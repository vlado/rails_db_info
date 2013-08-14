require_dependency "rails_dba/application_controller"

module RailsDba
  class TablesController < ApplicationController

    def index
      @tables = ActiveRecord::Base.connection.tables
    end
  end
end
