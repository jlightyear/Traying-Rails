require 'rails_helper'
require 'pry'

RSpec.describe LocationsController, :type => :controller do
Location.destroy_all

	describe "GET #index" do
		
		it "All the request is correct status code 200" do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end

		it "order desc and get the last n elements" do
			item1 = Location.create	name: "Home", city: "Barcelona", country: "Spain"
			item2 = Location.create	name: "Visit", city: "Madrid", country: "Spain"
			item3 = Location.create	name: "Beach", city: "Valencia", country: "Spain"
			expect(Location.order(created_at: :desc).limit(1).first).to eq(item3)
		end
	end

	describe "GET #show, id" do
		before do
			@item = FactoryGirl.create	:location
		end
		
		
		it "All the request is correct status code 200" do
			get :show, id: @item.id

			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the show template" do
			get :show, id: @item.id
			expect(response).to render_template("show")
		end

		it "renders the not_found template" do
			get :show, id: 200
			expect(response).to have_http_status(404)
		end
	end
end
