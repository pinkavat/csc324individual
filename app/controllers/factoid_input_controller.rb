class FactoidInputController < ApplicationController
    def formpage
        @factoid = Factoid.new
    end

    def create
        @factoid = Factoid.new(factoid_params)
        @factoid.save
        render 'formpage'
    end

    private
    
        def factoid_params
            params.require(:factoid).permit(:glyph_key, :title, :content)
        end
end
