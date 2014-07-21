require 'rails_helper'

RSpec.describe Location, :type => :model do

	item = Location.new
	item.name = "Home"
	item.city = "Barcelona"
	item.country = "Spain"
	item.save

	it "iron_find return the same that find" do
		expect(Location.iron_find(item.id)).to eq(Location.find(item.id))
	end

	it "last_created return the last 'n' items created" do
		expect(Location.last_created(1).first).to eq(Location.last)
	end

	it "in_spain return Spain in country" do
		expect(Location.in_spain).to eq(Location.where(country: 'Spain'))
	end


end
