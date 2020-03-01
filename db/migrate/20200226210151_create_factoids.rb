class CreateFactoids < ActiveRecord::Migration[5.1]
  def change
    create_table :factoids do |t|
      t.string :glyph_key
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
