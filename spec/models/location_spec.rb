require 'rails_helper'
require 'pry'

RSpec.describe Location, :type => :model do
	before:each do
		 @item = FactoryGirl.create(:location)
		 @item1 = FactoryGirl.create(:location)
	end

	it "iron_find return the same that find" do
		expect(Location.iron_find(@item.id)).to eq(Location.find(@item.id))
	end

	it "last_created return the last 'n' items created" do
		expect(Location.last_created(2)).to eq(Location.order('created_at DESC').limit(2))
	end

	it "in_spain return Spain in country" do
		expect(Location.in_spain).to eq(Location.where(country: 'Spain'))
	end

  it "filter by date" do
	 	expect(Location.total_visits_in_month_of_year(7,2014).last).to eq(@item1)
  end

  it "validate presence of name" do
    expect(@item.errors[:name]).to be_empty
  end

  it "validate presence of city" do
    expect(@item.errors[:city]).to be_empty
  end

  it "validate the item" do
    expect(@item).to be_valid
  end
end
