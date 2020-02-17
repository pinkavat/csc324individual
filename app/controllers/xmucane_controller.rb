require 'mayan_date'

class XmucaneController < ApplicationController

    def initialize
        # I *think* this doesn't break anything
        super()
        # Prep a mayan date visible to all pages (TODO perhaps move this to just the main page controller later)
        @test_date = MayanDate.new
        @test_date.gregorian = Date.today
    end
  

    def home
        # For generating the date dynamically, there are three parts.
        # Long Count Radices are repeated five times; the numerals alone change.
        # Two Calendar Rounds (both numerals and glyphs change)
        # One ISIG (or Night Lord if we change that) (either one is a single change)
        # The generative function must set the image file, the alt-text, and the overlay if we're doing that.
    end

    def about
    end

    def glyphs
    end
end
