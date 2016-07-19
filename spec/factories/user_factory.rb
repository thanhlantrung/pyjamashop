FactoryGirl.define do
sequence(:email) { |n| 'user#{n}@email.com' }
	factory :user do
		email 
		password 'test123'
		first_name 'John'
		last_name 'Smith'
		admin false
	end

	factory :admin, class: User do
		email 
		password 'test123'
		admin true
		first_name 'Admin'
		last_name 'User'

	end

	factory :user_two, class: User do 
		email
		password 'test123'
		first_name 'Jenny'
		last_name 'Smith'
		admin false
	end

end