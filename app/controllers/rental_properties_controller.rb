class RentalPropertiesController < ApplicationController

	include RentalPropertiesHelper

	def index
		@properties = RentalProperty.all

		if params[:sort_by] == "title"
			@properties = @properties.order(:title)

		elsif params[:sort_by] == "capacity"
			@properties = @properties.order(:maxpersons)

		elsif params[:sort_by] == "price"
			@properties = @properties.order(:price)

		else
			@properties = @properties.sort_by{|property| property.distance_from_client}.reverse
		end

		client_location = geolocate(request.remote_ip)
		@properties.each do |property|
			property.distance_from_client = property.distance_from(client_location)
		end

	end

	def show
		@property = RentalProperty.find(params[:id])
		client_location = geolocate(request.remote_ip)
		@property.distance_from_client = @property.distance_from(client_location)
	end

end
