module RailsDba
  class Table

    attr_reader :name

    def initialize(table_name)
      @name = table_name
    end

    def columns
      connection.columns(name)
    end

    def column_properties
      %w(name sql_type null limit precision scale type default primary coder)
    end

    def to_param
      name
    end


    private

    def connection
      ActiveRecord::Base.connection
    end
  end
end
