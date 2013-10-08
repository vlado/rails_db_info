require_dependency "rails_dba/application_controller"
require 'rails_dba/table'
require 'rails_dba/table_entries'

module RailsDba
  class TablesController < ApplicationController

    def index
      @tables = ActiveRecord::Base.connection.tables
    end

    def show
      @table = RailsDba::Table.new(params[:id])
    end

    def entries
      @table = RailsDba::Table.new(params[:table_id])

      @entries = RailsDba::TableEntries.new(@table).paginate(:page => params[:page])
    end
  end
end
