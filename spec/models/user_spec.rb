require 'rails_helper'

RSpec.describe User, :type => :model do
 before(:each) do
  @user1 = FactoryGirl.build(:user)
 end

  it "User is valid" do
  	expect(@user1).to be_valid
  end
end
