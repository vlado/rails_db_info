module RailsDbInfo
  class TablesController < RailsDbInfo::ApplicationController

    def index
      @tables = ActiveRecord::Base.connection.tables.sort
    end

    def show
      @table = RailsDbInfo::Table.new(params[:id])
    end

    def entries
      @table = RailsDbInfo::Table.new(params[:table_id])
      @entries = RailsDbInfo::TableEntries.new(@table).paginate(:page => params[:page]).order(params[:sort])
    end
  end
end
