class LocationsController < ApplicationController
	def index
		@locations = Location.order(created_at: :desc)
							.limit(10)
	end

	def show
		@location = Location.find_by(id: params[:id])
		render plain: '404 not_found', status: 404 unless @location
	end
end
