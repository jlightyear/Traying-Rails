require 'rails_helper'

RSpec.describe Location, :type => :model do
	it "iron_find return the same that find" do
		item = Location.new
		item.name = "Home"
		item.city = "Barcelona"
		item.save
		expect(Location.iron_find(item.id)).to eq(Location.find(item.id))
	end
end
