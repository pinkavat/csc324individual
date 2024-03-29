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
            # clickable image of the glyph
            out << image_tag("glyphs/#{category}/#{glyphKey}.png", id: "glyph_#{glyphKey}",
            class: "glyphItem", onclick: "highlightGlyph(this)", alt: "#{TranslatorHelper::FANCY[glyphKey]}") <<
            # resultant popup
            (content_tag :div, class: "factoidContainer" do
                (content_tag :div, class: "factoidPaneTitle" do
                    content_tag(:b, "#{TranslatorHelper::TRANSCRIPTION[glyphKey]}")<<
                    content_tag(:i, "#{TranslatorHelper::FANCY[glyphKey]}")
                end) <<
                list_all_factoids(glyphKey) 
            end)
        end.html_safe
    end

end
