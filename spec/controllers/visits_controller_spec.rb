require 'rails_helper'

RSpec.describe VisitsController, :type => :controller do
	describe "GET #index" do
		it "All the request is correct status code 200" do
			get :index, location_id: 1
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the index template" do
			get :index, location_id: 1
			expect(response).to render_template("index")
		end

		it "get the location with the id in the URL" do
			l1 = Location.create name: 'Home', city: 'Barcelona', country: 'Spain'
			get :index, location_id: l1.id
			expect(assigns(:location)).to eq(l1)
		end

		it "get all the visits for the location" do
			l1 = Location.create name: 'Home', city: 'Barcelona', country: 'Spain'
			Visit.create location_id: l1.id, user_name: 'Paco', from_date: Time.now, to_date: Time.now + 1.hour
			Visit.create location_id: l1.id, user_name: 'Pepe', from_date: Time.now, to_date: Time.now + 5.hour
			Visit.create location_id: l1.id, user_name: 'Sandra', from_date: Time.now, to_date: Time.now + 2.day
			Visit.create location_id: l1.id, user_name: 'Martin', from_date: Time.now, to_date: Time.now + 1.hour
			Visit.create location_id: l1.id, user_name: 'Jose', from_date: Time.now, to_date: Time.now + 1.hour
			get :index, location_id: l1.id
			expect(assigns(:location).visits).to eq(l1.visits)
		end
	end

	describe "GET #show" do
		l1 = Location.create name: 'Home', city: 'Barcelona', country: 'Spain'
		v1 = Visit.create location_id: l1.id, user_name: 'Paco', from_date: Time.now, to_date: Time.now + 1.hour
			Visit.create location_id: l1.id, user_name: 'Pepe', from_date: Time.now, to_date: Time.now + 5.hour
			Visit.create location_id: l1.id, user_name: 'Sandra', from_date: Time.now, to_date: Time.now + 2.day
			Visit.create location_id: l1.id, user_name: 'Martin', from_date: Time.now, to_date: Time.now + 1.hour
			Visit.create location_id: l1.id, user_name: 'Jose', from_date: Time.now, to_date: Time.now + 1.hour

		it "All the request is correct status code 200" do
			get :show, location_id: l1.id, id: v1.id 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the show template" do
			get :show, location_id: l1.id, id: v1.id
			expect(response).to render_template("show")
		end

		it "returns 404 when doesn't find something" do
			get :show, location_id: 19, id: 4
			expect(response).to have_http_status(404)
		end

		it "Get the visit for the id in the URL" do
			get :show, location_id: l1.id, id: v1.id
			expect(assigns(:visit)).to eq(v1)
		end
	end
end
