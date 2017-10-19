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

		#test_location = "149.43.80.13"
		client_location = geolocate(request.remote_ip)
		@properties.each do |property|
			property.distance_from_client = property.distance_from(client_location)
		end
	end

	def show
		@property = RentalProperty.find(params[:id])
		#test_location = "149.43.80.13"
		client_location = geolocate(request.remote_ip)
		@property.distance_from_client = @property.distance_from(client_location)
	end

	def new
		@property = RentalProperty.new()
	end

	def create
		property = RentalProperty.new(create_update_params)
		location = geocode(property.address)
		property.latitude = location[0]
		property.longitude = location[1]

		if property.save
			flash[:notice] = "New property #{property.title} created successfully!"
			redirect_to rental_properties_path
		else
			flash[:warning] = "Something went wrong. Make sure your information is correct."
			redirect_to new_rental_property_path
		end
	end

	def edit
		@property = RentalProperty.find params[:id]
	end

	def update
		property = RentalProperty.find params[:id]
		property.update_attributes!(create_update_params)

		location = geocode(property.address)
		property.latitude = location[0]
		property.longitude = location[1]


		if property.save
			flash[:notice] = "Property #{property.title} updated successfully!"
			redirect_to rental_properties_path
		else
			flash[:warning] = "Something went wrong. Make sure your information is correct."
			redirect_to edit_rental_property_path
		end
	end

	def destroy
		@property = RentalProperty.find params[:id]
		@property.destroy
		flash[:notice] = "Property #{@property.title} deleted."
		redirect_to rental_properties_path
	end


	private
		def create_update_params

			params.require(:rental_property).permit(:title,:description,:bedrooms,:beds,:maxpersons, 
			:bathrooms, :pets_allowed,  :address, :price, :image)

		end

end
