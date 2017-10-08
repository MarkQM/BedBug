class RentalProperty < ApplicationRecord

	include RentalPropertiesHelper

	def self.filter_on_constraints(hash_of_constraints)
		#puts hash_of_constraints.keys
		#puts hash_of_constraints.values
		filteredRentalProperties = RentalProperty.all
		hash_of_constraints.each do |field, constraint|
			if (field == :bedrooms)
				if constraint.is_a? Integer
					#filteredRentalProperties = filteredRentalProperties.where('"#{field}" >= constraint')
					filteredRentalProperties = filteredRentalProperties.where('bedrooms >= :constraint', :constraint => constraint)
				end

			elsif (field == :beds)
				if constraint.is_a? Integer
					filteredRentalProperties = filteredRentalProperties.where('beds >= :constraint', :constraint => constraint)
				end


			elsif (field == :maxpersons)
				if constraint.is_a? Integer
					filteredRentalProperties = filteredRentalProperties.where('maxpersons >= :constraint', :constraint => constraint)
				end

			elsif (field == :bathrooms)
				if constraint.is_a? Integer
					filteredRentalProperties = filteredRentalProperties.where('bathrooms >= :constraint', :constraint => constraint)
				end

			elsif (field == :pets_allowed)
				if (constraint.is_a? FalseClass) || (constraint.is_a? TrueClass)
					filteredRentalProperties = filteredRentalProperties.where('pets_allowed == :constraint', :constraint => constraint)
				end

			elsif (field == :price)
				if constraint.is_a? Integer
					filteredRentalProperties = filteredRentalProperties.where('price <= :constraint', :constraint => constraint)
				end
			end
		end
		return filteredRentalProperties
	end

	def distance_from(location)

		if ([0,nil].include? location[0]) || ([0,nil].include? location[1])
			return Float::INFINITY
		end

		lat1 = degrees_to_rads(location[0].to_f)
	  	long1 = degrees_to_rads(location[1].to_f)
	  	lat2 = degrees_to_rads(self.latitude.to_f)
	  	long2 = degrees_to_rads(self.longitude.to_f)

	  	dlon = long2 - long1
	  	dlat = lat2 - lat1
	  	r = 3959

	  	a = (Math.sin(dlat/2))**2 + (Math.cos(lat1) * Math.cos(lat2) * (Math.sin(dlon/2))**2)
	  	c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
	  	d = r * c
	end

	def distance_within?(location, distance)
		if location.is_a? String
			location = geocode(location)
		end

		return (self.distance_from(location) <= distance)
	end


	private
  	  	def degrees_to_rads(angle)
  	  		return (angle/180) * Math::PI
  	  	end

end
