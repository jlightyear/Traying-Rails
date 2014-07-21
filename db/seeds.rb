# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Location.create name: 'Home', city: 'Barcelona'
Location.create name: 'Beach', city: 'Alicante'
Location.create name: 'Hotel', city: 'Madrid'
Location.create name: 'Bar', city: 'Zaragoza', description: 'Streets with a lot of bars'
Location.create name: 'Work', city: 'Barcelona', description: 'My last job was in the center of the city'
Location.create name: 'Holidays', city: 'New York', description: "It's an amazing place"