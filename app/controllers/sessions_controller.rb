class SessionsController < ApplicationController
	def new
	end

	def create

		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			render plain: "Entered correct password"
		else
			render plain: "Wrong Password"
		end

	end
end