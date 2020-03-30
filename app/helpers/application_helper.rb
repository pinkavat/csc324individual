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

    # Code for printing an expanded calendar round date
    def print_calendar_round(mayan_date)
        "#{mayan_date.tzolkin_trecena} #{TranslatorHelper::FANCY[mayan_date.tzolkin_name]}
        #{mayan_date.haab_day} #{TranslatorHelper::FANCY[mayan_date.haab_name]}
        G#{mayan_date.glyph_g}"
    end
end
