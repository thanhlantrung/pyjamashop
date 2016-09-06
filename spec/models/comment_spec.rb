require 'rails_helper'
	
describe Comment do 
	it "is invalid without a comment" do
		comment = Comment.new
		comment.valid?
		expect(comment.errors[:body]).to include("can't be blank")
	end

		it "is invalid without a rating" do 
			expect(Comment.new(body: 'Test')).not_to be_valid 
		end
	end