require_dependency "rails_db_info/application_controller"
require 'rails_db_info/table'
require 'rails_db_info/table_entries'

module RailsDbInfo
  class TablesController < ApplicationController

    def index
      @tables = ActiveRecord::Base.connection.tables
    end

    def show
      @table = RailsDbInfo::Table.new(params[:id])
    end

    def entries
      @table = RailsDbInfo::Table.new(params[:table_id])

      @entries = RailsDbInfo::TableEntries.new(@table).paginate(:page => params[:page])
    end
  end
end
