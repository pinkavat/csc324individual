class XmucaneController < ApplicationController
  
    @@popolVuhQuotes = ["Whatever there is that might be is simply not there.",
                        "Only the sea alone is pooled under all the sky; there is nothing whatever gathered together.",
                        "The Lords of Xibalba were seated there; but they were just mannequins, woodcarvings."]

    def home
        @rand_placeholder = @@popolVuhQuotes.shuffle.first
    end

    def about
    end

    def glyphs
    end
end
