class RentalPropertiesController < ApplicationController

	include RentalPropertiesHelper

	def index
		#client_location = "149.43.129.150"
		client_location = geolocate(request.remote_ip)

		search_filters = [:maxpersons, :price, :bathrooms, :distance, :address]
		hashOfConstraints = Hash.new

		load_session(search_filters)

		search_filters.each do |filter|
			if params[filter] && params[filter] != ''
				hashOfConstraints[filter] = params[filter]
			end
		end

		@properties = RentalProperty.filter_on_constraints(hashOfConstraints)

		@properties.each do |property|
			property.distance_from_client = property.distance_from(client_location)
		end

		@properties = @properties.sort_by{|property| property.distance_from_client}

		if params[:sort_by] == "title"
			@properties = @properties.sort_by{|property| property.title}
			#@properties = @properties.order(:title)

		elsif params[:sort_by] == "capacity"
			#@properties = @properties.order(:maxpersons)
			@properties = @properties.sort_by{|property| property.maxpersons}

		elsif params[:sort_by] == "price"
			#@properties = @properties.order(:price)
			@properties = @properties.sort_by{|property| property.price}
		end

		if params[:distance] && params[:distance] != ''
			if params[:address] && params[:address] != ''
				address = params[:address]
			else
				address = client_location
			end
		
			filtered_rental_properties = []
		 	@properties.each do |property|
				if property.distance_within?(address, params[:distance].to_i)
					filtered_rental_properties << property
				end
		 	end
		 	@properties = filtered_rental_properties
		end
	end

	def show
		@property = RentalProperty.find(params[:id])
		#client_location = "149.43.80.13"
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
		#console.debugger()
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


		def load_session(search_filters)
			session_fields = [:sort_by].concat(search_filters)
			redirect = false
			session_fields.each do |field|
				if params[field]
					session[field] = params[field]
				elsif session[field] != params[field]
					params[field] = session[field]
					redirect = true
				end
			end

			if redirect
				flash.keep
				#redirect_to(rental_properties_path)
				redirect_to(rental_properties_path(sort_by: session[:sort_by], maxpersons: session[:maxpersons], price: session[:price], 
					bathrooms: session[:bathrooms], distance: session[:distance], address: session[:address])) and return
			end
		end

end
