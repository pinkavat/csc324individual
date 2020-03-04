class AddIndexToFactoidsGlyphKey < ActiveRecord::Migration[5.1]
  def change
    add_index :factoids, :glyph_key
  end
end
