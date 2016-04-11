class Api::V1::BusinessesController < ApplicationController
	include ActionController::MimeResponds
	# Authentication code based on request headers included in application_controller 
	# before_action :authenticate_with_token!, only: [:update, :destroy]
	respond_to :json
	
	def index
		# businesses = Business.order(id: :asc).paginate(:page => params[:page], :per_page => 10)
		@businesses = Business.order(id: :asc)
		respond_with :api, :v1, @businessess
	end

	def show
		respond_with :api, :v1, Business.find(params[:id])
	end


end

