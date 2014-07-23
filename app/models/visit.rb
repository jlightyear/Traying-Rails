class Visit < ActiveRecord::Base
	belongs_to :location

	validates :from_date, presence: true
	validates :to_date, presence: true
	validates :user_name, format: { with: /\A[A-Za-z0-9]*\z/ }
	validates_associated :location
	validate :from_date_is_after_now
	validate :from_date_is_before_to_date

	def self.iron_find(id)
		where(id: id).first
	end

	def from_date_is_after_now
 		if from_date.to_i < Time.now.to_i
 			errors.add(:from_date, "Can't be before now")
 		end
 	end

	def from_date_is_before_to_date
 		if from_date.to_i > to_date.to_i
 		errors.add(:to_date, "Can't be before to date")
 		end
 	end
end
