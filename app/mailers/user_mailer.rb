class UserMailer < ApplicationMailer
	default from: "thanhlan.trung@gmail.com"

	def contact_form(email, name, message)
	@message = message
		mail(:from => email,
			:to => 'thanhlan.trung@gmail.com',
			:subject => "A new contact form message from #{name}")
	end
end
