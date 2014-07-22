require 'rails_helper'

RSpec.describe Visit, :type => :model do
  it "Has an attribute" do
  	v = Visit.new
  	expect(v).to have_attribute :location_id
  end
end
