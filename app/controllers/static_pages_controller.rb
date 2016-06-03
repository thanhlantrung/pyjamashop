class StaticPagesController < ApplicationController
  def index
  end

  def landing_page
  	@products = Product.all
  end

  def thank_you
  	@name = params[:name]
  	@email = params[:email]
  	@message =[:message]
  	ActionMailer::Base.mail(:from => @email,
  		:to => 'thanhlan.trung@gmail.com',
  		:subject => "New message from #{@name}",
  		:body => @message).deliver_now
  end
  
end
