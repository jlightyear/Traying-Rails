module ApplicationHelper
	def show_flash
		if flash[:notice]
			flash[:notice]
		end
	end
end
