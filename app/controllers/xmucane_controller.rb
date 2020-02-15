require 'mayan_date'

class XmucaneController < ApplicationController

    def initialize
        # I *think* this doesn't break anything
        super()
        # Prep a mayan date visible to all pages (TODO perhaps move this to just the main page controller later)
        @test_date = MayanDate.new
        @test_date.gregorian = Date.today
    end
  
    @@popolVuhQuotes = ["Whatever there is that might be is simply not there.",
                        "Only the sea alone is pooled under all the sky; there is nothing whatever gathered together.",
                        "The Lords of Xibalba were seated there; but they were just mannequins, woodcarvings.",
                        "Shame on you, Heart of Sky! Attempt no treachery before the countenance of Sovereign Plumed Serpent!",
                        "For the making of Earth they simply said \"Earth\".",
                        "Every Day, Every Morn, In the Dark, In the Dawn, R-r-r-rip, R-r-r-rip, R-r-r-rub, R-r-r-rub, Right in our faces, because of you!"]

    def home
        @rand_placeholder = @@popolVuhQuotes.shuffle.first
    end

    def about
    end

    def glyphs
    end
end
