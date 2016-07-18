require 'rails_helper'

describe UsersController, :type => :controller do 
	before do
		#@user =  User.create!(email: "test@email.com", password: "test123")
		@user = FactoryGirl.create(:user)
		#@usertwo = User.create!(email: "test2@email.com", password: "test123")
		@usertwo = FactoryGirl.create(:user)
	end

	describe "GET #show" do
		context "User is logged in" do
			before do
				sign_in @user
			end
			
				it "loads correct user details" do
					get :show, id: @user.id
			expect(response).to have_http_status(200)
			expect(assigns(:user)).to eq @user 
				end
		end

		context "No user is logged in" do
			it "redirects to login" do
				get :show, id: @user.id
				expect(response).to redirect_to(new_user_session_path)
			end
		end

		context "User is logged in" do
			before do
				sign_in @usertwo
			end

			context "Incorrect user" do
				it "redirects to login" do
					get :show, id: @user.id
					expect(assigns(:user)).not_to eq @usertwo
					expect(response).to redirect_to(root_path)
				end
			end
		end
	end
end
