require 'date'

# mayan_date.rb
#
# Code for converting between the Gregorian Calendar
# and the Mayan Hieroglyphic Calendar
# written February 2020 by Thomas Pinkava

# Augment Class class to get nontrivial attr_accessor behaviour
class Class
    # Parameters: the attribute to create accessors for and
    # the value to set @stale to if that attribute is mutated
    def md_attr_accessor(attr, stale_value)

        #getter; calls update before returning
        self.class_eval("def #{attr};update;@#{attr};end")

        #setter; adjusts the stale value to the indicated type
        unless stale_value.nil?
            self.class_eval("def #{attr}=(val);@#{attr}=val;@stale=:#{stale_value};end")
        end                               
    end
end




class MayanDate

    TZOLKIN_VEINTENAS = [   "ajaw", "imix", "ik", "akbal", "kan",
                            "chikchan", "kimi", "manik", "lamat",
                            "muluk", "ok", "chuwen", "eb", "ben",
                            "ix", "men", "kib", "kaban", "etznab", "kawak"
                        ].freeze

    HAAB_MONTHS = [ "pop", "wo", "sip", "sots", "sek",
                    "xul", "yaxkin", "mol", "chen", "yax",
                    "sak", "keh", "mak", "kankin", "muwan",
                    "pax", "kayab", "kumku", "wayeb"
                  ].freeze
    
    attr_accessor :conversion_constant

    # Information is retrieved using lazy conversion; the date is converted
    # upon request, and only if it was changed since last request.
    md_attr_accessor :gregorian,        :gregorian
    md_attr_accessor :mayan_day,        :mayan_mdc
    md_attr_accessor :long_count,       :mayan_lc
    md_attr_accessor :tzolkin_pos,      nil
    md_attr_accessor :tzolkin_trecena,  :mayan_cr
    md_attr_accessor :tzolkin_veintena, :mayan_cr
    md_attr_accessor :tzolkin_name,     nil
    md_attr_accessor :haab_pos,         nil
    md_attr_accessor :haab_day,         :mayan_cr
    md_attr_accessor :haab_month,       :mayan_cr
    md_attr_accessor :haab_name,        nil
    
    def initialize()
        # The conversion constant defaults to Goodman-Martinez-Thompson
        @conversion_constant = 584283

        # Whether the date information has been changed since last update
        # :fresh        the date info has not changed
        # :gregorian    the gregorian date info was recently changed
        # :mayan_lc     the long count info was recently changed
        # :mayan_mdc    the mayan day info was recently changed
        # :mayan_cr     the calendar round was recently changed
        @stale = :fresh

        # The Gregorian calendar date
        # 11th of August, 3114 BCE; the day of creation
        @gregorian = Date.new(-3113, 8, 11) 

        # The Long Count
        @mayan_day = 0
        # Stored in reverse order
        # Kin, Winal, Tun, K'atun, B'ak'tun, and optional Pik'tun, Kalab'tun, Kinchiltun, etc...
        # Guaranteed to contain at least the first five radices
        @long_count = [0, 0, 0, 0, 0]
  
        # Calendar Round: Tzolk'in
        @tzolkin_pos = 159
        @tzolkin_trecena = 4
        @tzolkin_veintena = 0
        @tzolkin_name = TZOLKIN_VEINTENAS[@tzolkin_veintena]

        # Calendar Round: Haab'
        @haab_pos = 348
        @haab_day = 8
        @haab_month = 17
        @haab_name = HAAB_MONTHS[@haab_month]
        
    end



    # Set the Gregorian Date based on the Mayan Day
    def greg_from_mdc
        j = @mayan_day + @conversion_constant
        f = j + 1363 + (((4 * j + 274277) / 146097) * 3) / 4
        e = 4 * f + 3
        h = 5 * ((e % 1461) / 4) + 2
        d = ((h % 153) / 5) + 1
        m = (((h / 153) + 2) % 12) + 1
        y = (e / 1461) - 4716 + ((14 - m) / 12)
        @gregorian = Date.new(y, m, d);
    end



    # Set the Mayan Day based on the Gregorian Date
    def mdc_from_greg
        a = (14 - @gregorian.month) / 12
        y = @gregorian.year + 4800 - a
        m = @gregorian.month + (12 * a) - 3
        # I don't trust Ruby date's julian day computation
        jday = @gregorian.day + (((153*m)+2)/5)+(365*y)+(y/4)-(y/100)+(y/400)-32045
        @mayan_day = jday - @conversion_constant;
    end



    # Set the Mayan Day based on the Long Count
    def mdc_from_lc
        radix = 1
        @mayan_day = 0
        @long_count.each_with_index do |amount, index|
            if (index == 2)
                radix = 360 # Winals complicate everything
            end
            @mayan_day += amount * radix
            radix *= 20
        end
    end



    # Set the Long Count based on the Mayan Day
    def lc_from_mdc
        md_temp = @mayan_day
        index = 0
        lc_out = []
        while (md_temp > 0)
            radix = (index == 1) ? 18 : 20  # Winals again
            lc_out.append(md_temp % radix)
            md_temp /= radix
            index += 1
        end
        # Guaranteed fill of first five radices
        while (index < 5)
            lc_out.append(0)
            index += 1
        end
        @long_count = lc_out
    end



    # Set the Mayan Day based on the Calendar Round
    def mdc_from_cr
        #TODO not a supported operation yet
        raise "conversion from calendar round not yet supported"
    end



    # Set the Calendar Round based on the Mayan Day
    def cr_from_mdc
        @tzolkin_pos = (@mayan_day + 159) % 260
        @tzolkin_trecena = (@tzolkin_pos % 13) + 1
        @tzolkin_veintena = (@tzolkin_pos + 1).abs % 20
        @tzolkin_name = TZOLKIN_VEINTENAS[@tzolkin_veintena]

        @haab_pos = (@mayan_day + 348) % 365
        @haab_day = @haab_pos % 20
        @haab_month = @haab_pos / 20
        @haab_name = HAAB_MONTHS[@haab_month]
    end



    # Update function is called by every getter created by md_attr_accessor
    def update()
        unless(@stale == :fresh)
            # Something has changed; recompute date info
            if(@stale == :gregorian)
                # The Gregorian Calendar was last updated, so compute the Mayan Calendar from that
                mdc_from_greg
                lc_from_mdc
                cr_from_mdc
            else
                # Some part of the Mayan Calendar was last updated; recover the Mayan Day
                if(@stale == :mayan_mdc)
                    lc_from_mdc
                    cr_from_mdc
                elsif(@stale == :mayan_lc)
                    mdc_from_lc
                    cr_from_mdc
                elsif(@stale == :mayan_cr)
                    mdc_from_cr
                    lc_from_mdc
                end
                # Convert the Mayan Day info to the relevant Gregorian Calendar Date
                greg_from_mdc
            end
        end
    end

end
