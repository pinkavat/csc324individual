require 'mayan_date'

class Factoid < ApplicationRecord
    # Valid Glyphs are the Tzolkin Veintenas, the Haab months, the Long Count Radices, and the Night Lords.
    @@ValidGlyphs = MayanDate.TZOLKIN_VEINTENAS + MayanDate.HAAB_MONTHS + ["baktun", "katun", "tun", "winal", "kin"] + (1..9).to_a.collect{|x| "G#{x}"}
    def validGlyphs
        @@ValidGlyphs
    end
    validates(:content, presence: true)
    validates(:glyph_key, inclusion: { in: @@ValidGlyphs})
end
