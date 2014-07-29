class Notes < ActiveRecord::Base
	belongs_to :location

	validates :name, presence: true
end
