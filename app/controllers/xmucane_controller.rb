require 'mayan_date'

class XmucaneController < ApplicationController

    def home
        @mayan_date = MayanDate.new
        if params[:date] then
            # Set the mayan date from the URL
            @mayan_date.gregorian = Date.strptime(params[:date], '%Y-%m-%d') 
        else
            # Set the mayan date to the current date
            @mayan_date.gregorian = Date.today
        end
    end

    def about
    end

    def glyphs
        @selectedGlyph = params[:id]
    end
end
