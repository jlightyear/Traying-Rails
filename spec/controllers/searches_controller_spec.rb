require 'rails_helper'

RSpec.describe SearchesController, :type => :controller do
	it "All the request is correct status code 200" do
		post :create
		expect(response).to be_success
		expect(response).to have_http_status(200)
	end

	it "renders the index template" do
		post :create
		expect(response).to render_template("locations/index")
	end
end
