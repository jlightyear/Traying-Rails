class User < ActiveRecord::Base
	has_many :visits, dependent: delete

	validates :name, presence: true
	validates :pwd, presence: true
	validates :email, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
