class Location < ActiveRecord::Base
	def self.iron_find(id)
		where(id: id).first
	end

	def self.last_created(n)
		order('created_at DESC').limit(n)
	end

	def self.in_spain
		where(country: 'Spain')
	end
end
