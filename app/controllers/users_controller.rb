class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
      # current_user = User.find(session[:user_id])
     @user = User.find(session[:user_id])
     puts 'fuckin ehh'
     puts @user
  end

  # def maps
    
  # end

  # GET /users/new
  def new
    # @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    # redirect_to 'sessions#login'

    respond_to do |format|
      if @user.save
      	# redirect_to 'sessions#create'
      	# check back here
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        # redirect_to 'sessions#create'
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit
    @user = User.find(session[:user_id])
    # p @user
  end

  def update
    @user = User.find(session[:user_id])
    p @user
    @user.update_attributes(user_params)
    render :edit
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_user
    #   @user = User.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
    params.require(:user).permit(:phone_number, :full_name, :email, :digits_id, :digits_access_token, :digits_access_secret, :latitude, :longitude)
  end
end
