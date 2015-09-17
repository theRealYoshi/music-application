# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


band1 = Band.create(name: 'Linkin Park')
band2 = Band.create(name: 'Limp Bizket')

album1 = Album.create(band_id: band1.id, performance: "STUDIO", title: "Hybrid Theory")
album2 = Album.create(band_id: band1.id, performance: "LIVE", title: "Live at creamfields")
album3 = Album.create(band_id: band2.id, performance: "LIVE", title: "Live at Coachella")
album4 = Album.create(band_id: band2.id, performance: "STUDIO", title: "Mission Impossible 2 Soundtrack")

track1 = Track.create(album_id: album2.id, track_type: "BONUS", track_title: "Not Crawling")
track2 = Track.create(album_id: album1.id, track_type: "REGULAR", track_title: "Crawling")
track3 = Track.create(album_id: album3.id, track_type: "BONUS", track_title: "Live at Coachella part 2")
track4 = Track.create(album_id: album4.id, track_type: "REGULAR", track_title: "Limp Bizket")
