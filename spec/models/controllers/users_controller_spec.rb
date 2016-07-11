require 'rails helper'

describe UserController, :type => :controller do 
	
	let(:user) { User.create! (email: "test@email.com", password: "test123")}
	
	describe "GET #show" do
		
		context "User is logged in" do
			before do
				sign_in user
			
				it "loads correct user details"
				get :show, id: @user.id
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq user 
			end
		end

		context "No user is logged in" do
			it "redirects to login" do
				get :show, id: @user.id
				expect(response).to redirect_to(root_path)
			end
		end
	end
end
