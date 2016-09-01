require 'rails_helper'
	describe Comment do 
		it "is invalid without a comment" do
		comment = Comment.new(comment: nil)
		comment.valid?
		expect(comment.errors[:comment]) to include("can't be blank")
	end

		it "is invalid without a rating" do 
			expect(:rating, presence: true).not_to be_valid
		end
	end