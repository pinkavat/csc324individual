module XmucaneHelper

    # ========== GLYPHS PAGE ==========

    # find every Factoid keyed to the indicated glyph and format into HTML
    def list_all_factoids(glyphKey)
        Factoid.where(:glyph_key => glyphKey).inject("") do |out, factoid|
            out << "<div class=\"factoid\">#{factoid.title.empty? ? "":"<h2>#{factoid.title}</h2>"}#{factoid.content}</div>"
        end.html_safe
    end

    # collate a set of dynamic glyph images (for the glyphs page)
    def get_glyph_set(glyphs, category)
        glyphs.inject("") do |out, glyphKey|
            out << image_tag("glyphs/#{category}/#{glyphKey}.png", id: "glyph_#{glyphKey}", alt: "#{TranslatorHelper::FANCY[glyphKey]}")
        end.html_safe
    end

    # collate a set of glyph factoids (for the glyphs page)
    def get_factoid_set(glyphs)
        glyphs.inject("") do |out, glyphKey|
            out << list_all_factoids(glyphKey)
        end.html_safe
    end

end
