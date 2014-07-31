module ApplicationHelper
	def notice
		flash[:notice] if flash[:notice]
	end

	def alert
		flash[:alert] if flash[:alert]
	end
	
	def edit_link(path)
		link_to "edit", path
	end
	
	def delete_link(path)
		link_to "delete", path, method: 'delete', confirm: "Are you sure?"
	end

	def resource_name
		:user
	end

	def resource
		@resource ||= User.new
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end
end
