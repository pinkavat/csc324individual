require 'mayan_date'

class XmucaneController < ApplicationController

    def home
        @mayan_date = MayanDate.new
        if params[:commit] == 'Calculate from Gregorian Date' then

            # Set the mayan date to the requested Gregorian Date from the URL
            year = params[:date][:year].to_i
            year = 1 - year if params[:date][:era] == 'BCE'
            begin
                @mayan_date.gregorian = Date.new(year, params[:date][:month].to_i, params[:date][:day].to_i)
            rescue
                # In the case of an invalid date URL, reset to the dawn of creation
                @mayan_date.mayan_day = 0;
            end

        elsif params[:commit] == 'Calculate from Long Count' then

            # Set the mayan date to the requested Long Count Date from the URL
            begin
                @mayan_date.long_count = [params[:lc][:kin].to_i, params[:lc][:winal].to_i, params[:lc][:tun].to_i, params[:lc][:katun].to_i, params[:lc][:baktun].to_i]
            rescue
                # In the case of an invalid Long Count URL, reset to the dawn of creation
                @mayan_date.mayan_day = 0;
            end

        elsif params[:commit] == '+1 Day' or params[:commit] == '-1 Day' then

            # Set the mayan date to the requested Mayan Day (hidden functionality for fixed-date buttons)
            @mayan_date.mayan_day = params[:mdc].to_i

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
