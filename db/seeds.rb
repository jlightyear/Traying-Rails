# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
l1 = Location.create name: 'Home', city: 'Barcelona', country: 'Spain'
l2 = Location.create name: 'Beach', city: 'Alicante', country: 'Spain'
l3 = Location.create name: 'Hotel', city: 'Madrid', country: 'Spain'
l4 = Location.create name: 'Bar', city: 'Zaragoza', country: 'Spain', description: 'Streets with a lot of bars'
l5 = Location.create name: 'Work', city: 'Barcelona', country: 'Spain', description: 'My last job was in the center of the city'
l6 = Location.create name: 'Holidays', city: 'New York', description: "It's an amazing place"

Visit.create location_id: l1.id, user_name: 'Paco', from_date: Time.now + 1.day, to_date: Time.now + 1.month
Visit.create location_id: l1.id, user_name: 'Pepe', from_date: Time.now + 1.day, to_date: Time.now + 5.month
Visit.create location_id: l1.id, user_name: 'Sandra', from_date: Time.now + 1.day, to_date: Time.now + 2.month
Visit.create location_id: l2.id, user_name: 'Martin', from_date: Time.now + 1.day, to_date: Time.now + 1.month
Visit.create location_id: l2.id, user_name: 'Jose', from_date: Time.now + 1.day, to_date: Time.now + 1.month