require 'mayan_date'

class XmucaneController < ApplicationController

    def home
        @mayan_date = MayanDate.new
        @mayan_date.gregorian = Date.today
    end

    def about
    end

    def glyphs
        @selectedGlyph = params[:id]
    end
end
