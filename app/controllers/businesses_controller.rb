require 'smarter_csv'
class BusinessesController <  ActionController::Base

	def index
	end

	def import
		if params[:file].blank?
			flash[:danger] = "You need to select a file first."
		else
			options = { :key_mapping => { id: nil, uuid: :uuid, name: :name, address: :address, address2: :address2, city: :city, state: :state, zip: :zip, country: :country, phone: :phone, website: :website} }
			n = SmarterCSV.process(params[:file].tempfile, options) do |array|
				Business.create(array.first)
			end
		end
		render :index
	end
end
