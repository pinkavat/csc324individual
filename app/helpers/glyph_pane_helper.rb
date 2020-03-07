module GlyphPaneHelper

    # compute the width that a Mayan Vigesimal-By-Fives numeral will require
    def numeral_space(numeral)
        [0, numeral-1].max / 5 + 1
    end

    # format the Long Count date as HTML
    def glyph_pair_long_count(numeral, radix, translation)
        content_tag :div, class: "glyphPairPane" do
            # numeral image
            image_tag("glyphs/numerals/#{numeral}.png", class: "glyphPairL#{numeral_space numeral}", alt: "#{numeral}")<<
            # radix glyph image
            image_tag("glyphs/longcount/#{radix}.png", alt: TranslatorHelper::FANCY[radix])<<
            # overlay
            (content_tag :div, class: "glyphOverlay", onclick:"location.href='#{glyphs_path}#glyph_#{radix}'" do
                content_tag(:b, "#{TranslatorHelper::TRANSCRIPTION[numeral]}-#{TranslatorHelper::TRANSCRIPTION[radix]}")<<
                "<br />".html_safe<<
                content_tag(:i, "#{TranslatorHelper::FANCY[numeral]} #{translation}")
            end)
        end
    end


    # format the Tzolk'in as HTML
    def glyph_pair_tzolkin(trecena, veintena)
        content_tag :div, class: "glyphPairPane" do
            # trecena numeral image
            image_tag("glyphs/numerals/#{trecena}.png", class: "glyphPairL#{numeral_space trecena}", alt: "#{trecena}")<<
            # veintena glyph image
            image_tag("glyphs/tzolkin/#{veintena}.png", alt: TranslatorHelper::FANCY[veintena])<<
            # overlay
            (content_tag :div, class: "glyphOverlay", onclick:"location.href='#{glyphs_path}#glyph_#{veintena}'" do
                content_tag(:b, "#{TranslatorHelper::TRANSCRIPTION[trecena]}-#{TranslatorHelper::TRANSCRIPTION[veintena]}")<<
                "<br />".html_safe<<
                content_tag(:i, "#{TranslatorHelper::FANCY[trecena]} #{TranslatorHelper::FANCY[veintena]}")
            end)
        end
    end


    #format the Haab' as HTML
    def glyph_pair_haab(day, month)
        content_tag :div, class: "glyphPairPane" do
            # day numeral image
            image_tag((day == 0)?"glyphs/numerals/seating.png":"glyphs/numerals/#{day}.png", class: "glyphPairL#{(day == 0)?3:(numeral_space day)}",
            alt: "#{day}")<<
            # month glyph image
            image_tag("glyphs/haab/#{month}.png", alt: TranslatorHelper::FANCY[month])<<
            # overlay
            (content_tag :div, class: "glyphOverlay", onclick:"location.href='#{glyphs_path}#glyph_#{month}'" do
                content_tag(:b, "#{(day == 0)?'CHUM':TranslatorHelper::TRANSCRIPTION[day]}-#{TranslatorHelper::TRANSCRIPTION[month]}")<<
                "<br />".html_safe<<
                content_tag(:i, "#{(day == 0)?'seating of':TranslatorHelper::FANCY[day]} #{TranslatorHelper::FANCY[month]}")
            end)
        end
    end


    # format the G glyph as HTML
    def glyph_single_g(g)
        content_tag :div, class: "glyphPairPane" do
            # G glyph image
            image_tag("glyphs/supplementary/G#{g}.png", class: "glyphPairFull", alt: TranslatorHelper::FANCY["G#{g}"])<<
            # overlay
            (content_tag :div, class: "glyphOverlay" do
                content_tag(:b, "#{TranslatorHelper::TRANSCRIPTION["G#{g}"]}")<<
                "<br />".html_safe<<
                content_tag(:i, "G#{g}")
            end)
        end
    end


end
