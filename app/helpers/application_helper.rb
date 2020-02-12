module ApplicationHelper

    # Expanded title rendered, shamelessly nicked from Hartl
    def expanded_title(page_title = '')
        base_title = "Xmucane"
        if page_title.empty?
            base_title
        else
            page_title + " - " + base_title
        end
    end
end
