require 'rails_helper'

RSpec.describe Visit, :type => :model do
  before(:each) do

  location_params = {
  	name: 'Home',
  	city: 'Barcelona',
  	country: 'Spain'
  }

  @l1 = Location.create location_params

  visit_params = {
  	location_id: @l1.id,
  	user_name: 'Paco',
  	from_date: Time.now + 1.day,
  	to_date: Time.now + 2.month
  }

  @v1 = Visit.new visit_params

  end

  it "Has an attribute" do
  	expect(@v1).to have_attribute :location_id
  end

  it "Visit is valid" do
    expect(@v1).to be_valid
  end

  it "from_date is after now" do
	expect(@v1.errors[:from_date]).to be_empty
  end

  it "from_date_is_before_to_date" do
	expect(@v1.errors[:to_date]).to be_empty
  end

end
