require "httparty"
class GoodBizController < ApplicationController
	include HTTParty

	def index
	end

	def show
		#GrouponAPI
		@response = HTTParty.get('https://partner-api.groupon.com/deals.json?tsToken=US_AFF_0_201236_212556_0&channel_id=travel&offset=0&limit=50')
		respond_to do |format|
		  format.html{render :index}
		  format.json{render json: @response}
		end
	end

end
