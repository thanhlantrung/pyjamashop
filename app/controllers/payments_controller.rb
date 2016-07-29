class PaymentsController < ApplicationController
 
  def create 
  	@product = Product.find(params[:product_id])
  	@user = current_user
  	token = params[:stripeToken]
    @price = params[:product_price]

  	begin
  		charge = Stripe::Charge.create(
  			# :amount => @product.price
        :amount => @price.to_i * 100,
  			:currency => "usd",
  			:source => token,
  			:description => params[:stripeEmail]
  			)

  			if charge.paid
  				Order.create(product_id: @product_id, user_id: current_user.id, total: @product.price)
  			end

  	rescue Stripe::CardError => e
  		#card declined
  		body = e.json_body
  		err = body[:error]
  		flash[:error] = "Unfortunately, there was an error processing your payment #{err[:message]}"
  	end
  	
  	redirect_to product_path(@product)
  	
  end 
end
