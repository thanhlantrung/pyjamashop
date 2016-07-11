require 'rails_helper'

	describe Product do
		context "when the product has comments" do 

			before do
				@product = Product.create!(name: "favourite pjs")
				@user = User.create!(email: "test@email.com", password: "testpw123")
				@product.comments.create!(rating: 1, user: @user, body: "Not my favourite pjs.")
				@product.comments.create!(rating: 3, user: @user, body: "Fair")
				@product.comments.create!(rating: 5, user: @user, body: "My favourite pjs!")
			end 

			it "returns the average rating of all comments" do
				expect(@product.average_rating). to eq (3)
			end
			
			it "is not valid" do
				expect(Product.new(description: "great pjs")).not_to be_valid
			end
		
		end 

	end

