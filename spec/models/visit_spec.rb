require 'rails_helper'

RSpec.describe Visit, :type => :model do
  before(:each) do
    @v1 = FactoryGirl.create(:visit)
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
