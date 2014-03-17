module RailsDbInfo
  class TableEntries

    attr_reader :table
    attr_accessor :current_page, :offset, :per_page

    delegate :each, :to => :load

    def initialize(table)
      @table = table
    end

    def load
      connection.exec_query("SELECT * FROM #{table.name} LIMIT #{per_page} OFFSET #{offset}")
    end

    def next_page
      current_page < total_pages ? (current_page + 1) : nil
    end

    def paginate(options = {})
      self.per_page = 10
      self.current_page = (options[:page] || 1).to_i
      self.offset = current_page * per_page - per_page
      self
    end

    def previous_page
      current_page > 1 ? (current_page - 1) : nil
    end

    def order(column_name)
      if column_name
        connection.exec_query("SELECT * FROM #{table.name} ORDER BY #{column_name} DESC")
      else
        connection.exec_query("SELECT * FROM #{table.name} ORDER BY id")
      end
    end

    def total_entries
      @total_entries ||= count
    end

    def total_pages
      total_entries.zero? ? 1 : (total_entries / per_page.to_f).ceil
    end


    private

    def count
      connection.exec_query("SELECT COUNT(*) FROM #{table.name}").rows.flatten.last.to_i
    end

    def connection
      ActiveRecord::Base.connection
    end

  end
end
