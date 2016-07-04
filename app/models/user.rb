class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :orders


after_create :send_welcome_mail

private
	def send_welcome_mail
		UserMailer.welcome(self).deliver_now
	end
end