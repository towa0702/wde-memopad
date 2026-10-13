module ApplicationHelper
    def menu_link_to(item)
      if item[:disabled]
        raw "<span class='disabled'>" + item[:name] +
          '(' + (t 'not_ready') + ')</span>'
      elsif current_page?(item[:link])
        raw "<span class='current_page'>" + item[:name] + "</span>"
      else
        link_to(item[:name], item[:link])
      end
    end
end