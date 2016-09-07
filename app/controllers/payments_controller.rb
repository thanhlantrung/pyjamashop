class PaymentsController < ApplicationController
 
  def create 
  	token = params[:stripeToken]
    @product = Product.find(params[:product_id])
  	@user = current_user
  
    @price = params[:product_price]

  	begin
  		charge = Stripe::Charge.create(
        :amount => (@product.price).to_i * 100,
  			:currency => "usd",
  			:source => token,
  			:description => params[:stripeEmail]
  			)

  			if charge.paid
  				Order.create!(product_id: @product_id, user_id: current_user.id, total: @product.price)
          UserMailer.order_complete(@user, @product).deliver_now
  			end

  	rescue Stripe::CardError => e
  		#card declined
  		body = e.json_body
  		err = body[:error]
  		flash[:error] = "Unfortunately, there was an error processing your payment #{err[:message]}"
  	end
  	
  	redirect_to payments_thanks_order_path
  	
  end 
end
