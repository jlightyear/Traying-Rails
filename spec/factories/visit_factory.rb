FactoryGirl.define do
	factory :visit do
		sequence(:user_id) { |u| "User #{u}" }
		from_date { Time.now + 1.day }
	  to_date { Time.now + 2.month }
	  association :location
	  association :user
	end
end