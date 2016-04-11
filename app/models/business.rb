class Business < ActiveRecord::Base
	validates :uuid, presence: true
	validates :name, presence: true
	validates :address, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true, numericality: true
	validates :country, presence: true
	validates :phone, presence: true, numericality: true
	validates :website, presence: true
end
