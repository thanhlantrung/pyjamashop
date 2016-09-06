class UserMailer < ApplicationMailer
	default from: "thanhlan.trung@gmail.com"

	def contact_form(email, name, message)
	@message = message
		mail(:from => email,
			:to => 'thanhlan.trung@gmail.com',
			:subject => "A new contact form message from #{name}")
	end

	def welcome(user)
		@user = user
		mail(to: @user.email, subject: 'Welcome to The Pyjama Shop')
	end

	def order_complete(user, product)
		@user = user
		@product = product
		mail(to: @user.email, subject: 'Thank you for your order!')
end
