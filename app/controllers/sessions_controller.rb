class SessionsController < ApplicationController
  def new
  	if current_user
  		redirect_to root_path
  	else
  		@user = User.new
  		render :new
  	end
  end

  def create
  	user = User.find_by_email(user_params[:email])
  	if user && user.authenticate(user_params[:password])
  		session[:user_id] = user.id
  		redirect_to root_path
  	else
  		flash[:error] = "Failed to authenticate. Please try again"
  		redirect_to login_path
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end

  private
  	def user_params
  		params.require(:user).permit(:email, :password, :phone, :lat, :lng)
  	end
end
