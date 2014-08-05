require 'rails_helper'

RSpec.describe VisitsController, :type => :controller do
	before:each do
		 @item = FactoryGirl.create(:location)
		 @item1 = FactoryGirl.create(:location)
		 @v1 = Visit.create location_id: @item.id, from_date: Time.now, to_date: Time.now + 1.hour
	end

	describe "GET #index" do
		it "All the request is correct status code 200" do
			get :index, location_id: @item.id
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the index template" do
			get :index, location_id: @item.id
			expect(response).to render_template("index")
		end

		it "get the location with the id in the URL" do
			get :index, location_id: @item1.id
			expect(assigns(:location)).to eq(@item1)
		end

		it "get all the visits for the location" do
			get :index, location_id: @item.id
			expect(assigns(:location).visits).to eq(@item.visits)
		end
	end

	describe "GET #show" do

		it "All the request is correct status code 200" do
			get :show, location_id: @item.id, id: @v1.id
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the show template" do
			get :show, location_id: @item.id, id: @v1.id
			expect(response).to render_template("show")
		end

		it "returns 404 when doesn't find something" do
			get :show, location_id: 19, id: 4
			expect(response).to have_http_status(404)
		end

		it "Get the visit for the id in the URL" do
			get :show, location_id: @item.id, id: @v1.id
			expect(assigns(:visit)).to eq(@v1)
		end
	end
end
