module RailsDba
  class Table

    attr_reader :name

    def initialize(table_name)
      @name = table_name
    end

    def columns
      connection.columns(name)
    end

    def records
      connection.exec_query("SELECT * FROM #{name}")
    end


    private

    def connection
      ActiveRecord::Base.connection
    end

    def model
      name.singularize.humanize.constantize
    end

  end
end
