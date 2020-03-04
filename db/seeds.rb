# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

factoidBase = Factoid.create([
    {glyph_key:'kin', title: 'Long Count radix', content: 'K\'in is the Mayan word for "Sun"; this is the number of days.'},
    {glyph_key:'winal', title: 'Long Count radix', content: 'Literally meaning "20", a Winal is worth 20 K\'ins.'},
    {glyph_key:'tun', title: 'Long Count radix', content: 'The Tun is an approximate solar year, worth 18 Winals or 360 K\'ins.'},
    {glyph_key:'katun', title: 'Long Count radix', content: 'One score years; that is, 20 Tun or 7,200 K\'ins.'},
    {glyph_key:'baktun', title: 'Long Count radix', content: 'Literally meaning "bundle", a B\'aktun is worth 20 K\'atun or 144,000 K\'ins.'}
])

factoidFunFacts = Factoid.create([
    {glyph_key:'baktun', title: 'Fun Fact', content: 'There exist larger Long Count radices on certain monuments, such as the 2,880,000 day Piktun, the 57,600,000 day Kalab\'tun, and the 1,152,000,000 day Kinchiltun; some monuments represent the date of creation with a large number of 13s filling in the places of yet higher radices, but it is not clear whether these are meant to represent a literal date.'}
])
