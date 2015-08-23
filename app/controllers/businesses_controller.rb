class BusinessesController < ApplicationController
  
  	def index
    	@business = Business.all
    	render :json => @business
    end

    def show
      @business = Business.find(params[:id])
      render :show
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      # def set_user
      #   @user = User.find(params[:id])
      # end

      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
      params.require(:business).permit(:lat, :lng)
    end
end
