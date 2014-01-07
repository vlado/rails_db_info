module RailsDbInfo
  module ApplicationHelper

    def paginate_table_entries(entries)
      return if entries.total_pages == 1
      prev_page_text = '< Previous'
      next_page_text = 'Next>'

      html = '<div class="pagination">'
      html << (entries.previous_page ? link_to(prev_page_text, :page => entries.previous_page) : prev_page_text)
      html << "&nbsp;#{page_links_for_pagination(entries)}&nbsp;"
      html << (entries.next_page ? link_to(next_page_text, :page => entries.next_page) : next_page_text)
      html << '</div>'

      sanitize(html)
    end

private

    def page_links_for_pagination(entries)
      pages = pages_for_pagination(entries)
      links = []

      pages.each_with_index do |page,index|
        if page == entries.current_page
          links << content_tag(:b, page)
        else
          links << link_to(page, :page => page)
        end
        links << " ... " if page != pages.last && (page + 1) != pages[index+1]
      end

      links.join(' ')
    end

    def pages_for_pagination(entries)
      last_page = entries.total_pages
      current_page = entries.current_page

      pages = if last_page > 10
        [1, 2, 3] +
        (current_page-2..current_page+2).to_a +
        (last_page-2..last_page).to_a
      else
        (1..last_page).to_a
      end

      pages.uniq.select { |p| p > 0 && p <= last_page }
    end

  end
end
