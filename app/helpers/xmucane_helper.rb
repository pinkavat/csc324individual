module XmucaneHelper

    # compute the width that a Mayan Vigesimal-By-Fives numeral will require
    def numeral_space(numeral)
        [0, numeral-1].max / 5 + 1
    end

    # find every Factoid keyed to the indicated glyph and format into HTML
    def list_all_factoids(glyphKey)
        Factoid.where(:glyph_key => glyphKey).inject("") do |out, factoid|
            out << "<div class=\"factoid\">#{factoid.title.empty? ? "":"<h2>#{factoid.title}</h2>"}#{factoid.content}</div>"
        end.html_safe
    end

    def get_glyph_set(glyphs)
        glyphs.inject("") do |out, glyphKey|
            # switch to rails funcs
            out << "#{glyphKey}, "
        end.html_safe
    end

    def get_factoid_set(glyphs)
        glyphs.inject("") do |out, glyphKey|
            out << list_all_factoids(glyphKey)
        end.html_safe
    end

end
