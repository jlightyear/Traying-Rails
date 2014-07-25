require 'rails_helper'

RSpec.describe User, :type => :model do
 before(:each) do

  @user_params = {
  	name: 'Joseluis',
  	pwd: 'mypwd',
  	email: 'joseluis.estrach@gmail.com'
  }

  @user1 = User.create @user_params
 end

  it "Can assign name" do
  	expect(@user1.name).to eq(@user_params [:name])
  end

  it "Can assign pwd" do
  	expect(@user1.pwd).to eq(@user_params [:pwd])
  end

  it "Can assign email" do
  	expect(@user1.email).to eq(@user_params [:email])
  end

  it "User is valid" do
  	expect(@user1).to be_valid
  end

end
