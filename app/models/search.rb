class Search
	attr_accessor :keyword

	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming

	def search_locations
		Location.where(:name => @keyword)
	end
end
