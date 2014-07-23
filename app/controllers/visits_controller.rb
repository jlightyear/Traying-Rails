class VisitsController < ApplicationController
	def index
		time = DateTime.new
		@location = Location.find_by(id: params[:location_id])
		@visits = @location.visits.where()
	end

	def show
		@location = Location.find_by(id: params[:location_id])
		@visit = @location.visits.find_by(id: params[:id]) if @location
		render plain: '404 not_found', status: 404 if !@location || !@visit
	end
end
