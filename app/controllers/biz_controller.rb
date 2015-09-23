require "httparty"
class BizController < ApplicationController
	include HTTParty

  def index
  	#GrouponAPI
  	@response = HTTParty.get('https://partner-api.groupon.com/deals.json?tsToken=US_AFF_0_201236_212556_0&offset=0&limit=50')
  	respond_to do |format|
  		format.html{render :index}
  		format.json{render json: @response}
  	end
  	puts @response["deals"][0]
  end

  def show
    #GrouponAPI   
    # 'https://partner-api.groupon.com/deals.json?tsToken=US_AFF_0_201236_212556_0&channel_id=goods&offset=0&limit=50'           
    @response = HTTParty.get('https://partner-api.groupon.com/deals.json?tsToken=US_AFF_0_201236_212556_0&filters=category:food-and-drink&offset=0&limit=50')
    respond_to do |format|
      format.html{render :index}
      format.json{render json: @response}
    end
    puts @response["deals"][1]
  end

end
