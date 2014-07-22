require 'rails_helper'

RSpec.describe LocationsController, :type => :controller do
	Location.all.each { |location| p location.name }
	describe "GET #show, id" do
		item = Location.new
		item.name = "Home"
		item.city = "Barcelona"
		item.country = "Spain"
		item.save

		it "All the request is correct status code 200" do
			get :show, id: item.id
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the show template" do
			get :show, id: item.id
			expect(response).to render_template("show")
		end

		it "renders the not_found template" do
			get :show, id: 200
			expect(response).to have_http_status(404)
		end
	en
end
