FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "Username#{n}" }
		email 'correo@gmail.com'
		password 'mypassword'
		factory :user_invalid_email do
			email 'correogmail.com'
		end
	end
end