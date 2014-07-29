class LocationsController < ApplicationController
	def index
		@locations = Location.order(created_at: :desc)
							.limit(10)
	end

	def new
		@location = Location.new
		@location.notes.build
	end

	def create
		@location = Location.new location_params
		if params[:Cancel]
			redirect_to locations_path
		elsif @location.save
			flash[:notice] = "Congratulations, location was created!"
			redirect_to locations_path
		else
			render 'new'
		end
	end

	def edit
		@location = Location.find(params[:id])
		@location.notes.build
	end

	def update
		@location = Location.find(params[:id])
		if params[:Cancel]
			redirect_to locations_path
		elsif @location.update location_params
			flash[:notice] = "Congratulations, location was updated!"
			redirect_to location_path
		else
			render 'edit'
		end
	end

	def destroy
		@location = Location.find(params[:id])
		@location.delete
		flash[:notice] = "Congratulations, location was deleted!"
		redirect_to locations_path
	end

	def show
		@location = Location.find_by(id: params[:id])
		render plain: '404 not_found', status: 404 unless @location
	end

	def location_params
		params.require(:location).permit(:name, :city, :country, :description, notes_attributes: [:id, :name])
	end
end
