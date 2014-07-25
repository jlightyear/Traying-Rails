module ApplicationHelper
	def show_flash
		if flash[:notice]
			flash[:notice]
		end
	end

	def edit_link(path)
		link_to "edit", path
	end
	
	def delete_link(path)
		link_to "delete", path, method: 'delete', confirm: "Are you sure?"
	end
end
