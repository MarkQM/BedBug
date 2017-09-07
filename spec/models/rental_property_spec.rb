require 'rails_helper'

RSpec.describe RentalProperty, type: :model do
  describe "check attributes and methods" do
    it "should be able to create a RentalProperty object which has the correct methods on it" do
      rp = RentalProperty.create!(title: "Pwll o le", description: "", bedrooms: 2, beds: 2, maxpersons: 4, bathrooms: 1, pets_allowed: false, address: "Rockport, ME", price: 120.50, latitude: 44.1845, longitude: 69.0761)
      expect(rp).to respond_to :title
      expect(rp).to respond_to :description
      expect(rp).to respond_to :bedrooms
      expect(rp).to respond_to :beds
      expect(rp).to respond_to :bathrooms
      expect(rp).to respond_to :maxpersons
      expect(rp).to respond_to :pets_allowed
      expect(rp).to respond_to :address
      expect(rp).to respond_to :price
      expect(rp).to respond_to :latitude
      expect(rp).to respond_to :longitude
      expect(rp).to respond_to :distance_within?
      expect(rp).to respond_to :distance_from
      expect(rp).to respond_to :distance_from_client
      expect(rp).to respond_to :distance_from_client=
      expect(RentalProperty).to respond_to :filter_on_constraints
    end
  end
end
