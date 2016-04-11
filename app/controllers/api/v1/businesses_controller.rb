class Api::V1::BusinessesController < ApplicationController
	include ActionController::MimeResponds
	# Authentication code based on request headers included in application_controller 
	# before_action :authenticate_with_token!, only: [:update, :destroy]
	respond_to :json
	
	def index
		# Example of using parameters: http://api.ownlocalbusiness.dev/businesses?per_page=60&page=10 
		
		begin
			@businesses = Business.order(id: :asc).page(params[:page]).per(params[:per_page])
			render json: @businesses, meta: { pagination:
                                   { per_page: params[:per_page],
                                     total_pages: @businesses.total_pages,
                                     total_objects: @businesses.total_count } }
		rescue Exception => e
			render json: "There was an error processing your request. Please try again", status: 400
		end
		
	end

	def show
		respond_with :api, :v1, Business.find(params[:id]), status: 200
	end
end

