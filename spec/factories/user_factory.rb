FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "Username#{n}" }
		pwd 'mypwd'
		email 'correo@gmail.com'

		factory :user_invalid_email do
			email 'correogmail.com'
		end
	end
end