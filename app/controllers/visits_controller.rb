class VisitsController < ApplicationController
	def index
		time = DateTime.new
		@location = Location.find_by(id: params[:location_id])
		@visits = @location.visits
	end

	def new
		@location = Location.find_by(id: params[:location_id])
		@visit = Visit.new
	end

	def create
			@location = Location.find_by(id: params[:location_id])
			@visit = @location.visits.new visit_params
		if params[:Cancel]
			redirect_to location_path(@location)
		elsif @visit.save
			flash[:notice] = "Congratulations, visit was created!"
			#redirect_to action: 'index', controller: 'visits', location_id: @location.id
			redirect_to location_visits_path @location.id
		else
			render 'new'
		end
	end

	def edit
		@location = Location.find_by(id: params[:location_id])
		@visit = @location.visits.find_by(id: params[:id])
	end

	def update
		@location = Location.find_by(id: params[:location_id])
		@visit = @location.visits.find_by(id: params[:id])
		if params[:Cancel]
			redirect_to location_visits_path @location.id
		elsif @visit.update visit_params
			flash[:notice] = "Congratulations, visit was updated!"
			redirect_to location_visits_path @location.id
		else
			render 'edit'
		end
	end

	def destroy
		@location = Location.find_by(id: params[:location_id])
		@visit = @location.visits.find_by(id: params[:id])
		@visit.delete
		flash[:notice] = "Congratulations, visit was deleted!"
		redirect_to location_visits_path @location.id
	end

	def show
		@location = Location.find_by(id: params[:location_id])
		@visit = @location.visits.find_by(id: params[:id]) if @location
		render plain: '404 not_found', status: 404 if !@location || !@visit
	end

	private

	def visit_params
		params.require(:visit).permit(:user_name, :from_date, :to_date)
	end
end
