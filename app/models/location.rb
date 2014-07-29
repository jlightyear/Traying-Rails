class Location < ActiveRecord::Base
	has_many :visits
	has_many :notes
        accepts_nested_attributes_for :notes, :allow_destroy => true, :reject_if => proc { |attrs| attrs[:name].blank? }

	validates :name, presence: true
	validates :city, presence: true
	validates :name, :length => { :maximum => 30 }
	
	def self.iron_find(id)
		where(id: id).first
	end

	def self.last_created(n)
		order('created_at DESC').limit(n)
	end

	def self.in_spain
		where(country: 'Spain')
	end

	def self.total_visits_in_month_of_year(month,year)
		from = DateTime.new(year,month,1,0,0,0,'0')
		to = from + 1.month
		where('created_at > ?', from).where('created_at < ?', to)
	end
end
