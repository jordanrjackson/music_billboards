# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

artists = Artist.create([{ name: 'Def Leppard' }, { name: 'INXS' }])
songs = Song.create(name: 'Love Bites', artist: artist.first)
billboards = Billboard.create(name: Billboard Hot 100 (1988))