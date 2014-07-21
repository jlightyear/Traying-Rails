class LocationsController < ApplicationController
	def index
		@locations = Location.order(created_at: :desc)
							.limit(10)
	end
end
