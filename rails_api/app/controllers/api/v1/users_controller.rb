class Api::V1::UsersController < ApplicationController
	def create
		@user = User.new(user_params)
		if @user.save
			render json:{message: "Successfully created your user account", data: @user, status_code: 200}
		else
            render json:{message: "Failure", data: @user.errors,  status_code: 422}
		end
	end

	 def show
	 
	 	@user=User.find_by_name(params[:name])
	    render json:{message: "Successfully Displayed", data: @user, status_code: 200}
	 end

	 def update
		@user = User.find_by_name(params[:name])
		@user.update_attributes(user_params)
		 render json:{message: "Successfully Updated", data: @user, status_code: 200}
	end

	private
	def user_params
		params.require(:user).permit(:name, :age, :role, :gender)
	end

end