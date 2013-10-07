require_dependency "rails_dba/application_controller"
require 'rails_dba/table'

module RailsDba
  class TablesController < ApplicationController

    def index
      @tables = ActiveRecord::Base.connection.tables
    end

    def show
      @table = RailsDba::Table.new(params[:id])
      @columns = ActiveRecord::Base.connection.columns(params[:id])
    end
  end
end
