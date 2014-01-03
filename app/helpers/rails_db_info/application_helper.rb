module RailsDbInfo
  module ApplicationHelper

    def paginate_table_entries(entries)
      return if entries.total_pages == 1
      prev_page_text = '< Previous page'
      next_page_text = 'Next page >'
      first_page     = 'First page..'
      last_page      = '..Last page'

      html = '<div class="pagination">'
      html << (entries.first_page ? link_to(first_page, :page => entries.first_page) : "")
      html << (entries.previous_page ? link_to(prev_page_text, :page => entries.previous_page) : prev_page_text)
      html << "&nbsp;Page #{entries.current_page} of #{entries.total_pages} &nbsp;"
      html << (entries.next_page ? link_to(next_page_text, :page => entries.next_page) : next_page_text)
      html << (entries.last_page ? link_to(last_page, :page => entries.last_page) : "")
      html << '</div>'

      sanitize(html)
    end

  end
end
