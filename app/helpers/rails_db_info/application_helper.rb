module RailsDbInfo
  module ApplicationHelper

    def paginate_table_entries(entries)
      return if entries.total_pages == 1
      prev_page_text = '< Previous page'
      next_page_text = 'Next page >'

      html = '<div class="pagination">'
      html << (entries.previous_page ? link_to(prev_page_text, :page => entries.previous_page) : prev_page_text)
      html << "&nbsp;Page #{entries.current_page} of #{entries.total_pages} &nbsp;"
      html << (entries.next_page ? link_to(next_page_text, :page => entries.next_page) : next_page_text)
      html << '</div>'

      sanitize(html)
    end

  end
end
