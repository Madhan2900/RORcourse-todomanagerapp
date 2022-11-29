class UsersController < ApplicationController
	def index
		@users = User.all 
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			login[:id] = @user.id
			redirect_to users_path
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def login
		user = User.find_by(login_params)
		if user && user.authenticate(login_params[:password])
			render plain: "true"
		else
			render plain: "false"
		end
	end


	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

	def login_params
		params.require(:user).permit(:email, :password)
	end

end
