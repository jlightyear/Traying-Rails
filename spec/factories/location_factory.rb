FactoryGirl.define do
	factory :location do
	sequence(:name) { |n| "Location #{n}" }
	city 'Madrid'
	country 'Spain'
	end
end