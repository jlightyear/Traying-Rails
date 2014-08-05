class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
			@user = User.new user_params
		if params[:Cancel]
			redirect_to users_path
		elsif @user.save
			flash[:notice] = "Congratulations, a new user was created!"
			redirect_to users_path
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if params[:Cancel]
			redirect_to users_path
		elsif @user.update user_params
			flash[:notice] = "Congratulations, user was updated!"
			redirect_to user_path
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:notice] = "Congratulations, user was deleted!"
		redirect_to users_path
	end

	def show
		@user = User.find(params[:id])
		render plain: '404 not_found', status: 404 unless @user
	end

	def user_params
		params.require(:user).permit(:name, :email)
	end

end
