class UserMailer < ApplicationMailer
	default from: "thanhlan.trung@gmail.com"

	def contact_form(email, name, message)
	@message = message
		mail(:from => email,
			:to => 'thanhlan.trung@gmail.com',
			:subject => "A new contact form message from #{name}")
	end

	def welcome_email(user)
		@user = user
		@url = 'http://thepyjamashop.herokuapp.com/sign_up'
		mail(to: @user.email, subject: 'Welcome to The Pyjama Shop')
	end
end
