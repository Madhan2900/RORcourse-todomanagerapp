class LoginController < ApplicationController

	def new
		
	end

	def create
		user = User.find_by(login_params)
		if user && user.authenticate(login_params[:password])
			render plain: "true"
		else
			render plain: "false"
		end
	end

	private

	def login_params
		params.require(:login).permit(:email, :password)
	end
end 
	