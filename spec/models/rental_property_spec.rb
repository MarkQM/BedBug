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

  describe "distance_within tests" do
    before(:example) do
      rp = RentalProperty.create!(title: "Pwll o le", description: "", bedrooms: 2, beds: 2, maxpersons: 4, bathrooms: 1, pets_allowed: false, address: "Rockport, ME", price: 120.50, latitude: 44.1845, longitude: 69.0761)
    end

    it "should return false when given a bad location" do
      rp = RentalProperty.first
      expect(rp.distance_within?("..", 10)).to be false
      expect(rp.distance_within?([nil, nil], 10)).to be false
    end

    it "should return true when given a near-enough location" do
      rp = RentalProperty.first
      expect(rp.distance_within?([44.184, 69.076], 10)).to be true
    end

    it "should return false when given a faraway location" do
      rp = RentalProperty.first
      expect(rp.distance_within?([44.184, -69.076], 10)).to be false
    end
  end

  describe "filter_on_constraints tests" do
    before(:example) do
      1.upto(3) do |i|
        RentalProperty.create!(title: "Pwll o le #{i}", bedrooms: "#{i}", beds: "#{i*2}", maxpersons: "#{i*4}", bathrooms: "#{i}", pets_allowed: i%2==0, price: i*10.25)
      end
    end

    it "should filter correctly for pets_allowed" do
      q = RentalProperty.filter_on_constraints(:pets_allowed => true)
      expect(q.length).to eq(1)
    end

    it "should filter correctly for bedrooms" do
      q = RentalProperty.filter_on_constraints(:bedrooms => 2)
      expect(q.length).to eq(2)
      q = RentalProperty.filter_on_constraints(:bedrooms => 4)
      expect(q.length).to eq(0)
    end

    it "should filter correctly for bathrooms" do
      q = RentalProperty.filter_on_constraints(:bathrooms => 0)
      expect(q.length).to eq(3)
      q = RentalProperty.filter_on_constraints(:bathrooms => 1)
      expect(q.length).to eq(3)
      q = RentalProperty.filter_on_constraints(:bathrooms => 3)
      expect(q.length).to eq(1)
      q = RentalProperty.filter_on_constraints(:bathrooms => 4)
      expect(q.length).to eq(0)
    end

    it "should filter correctly on maxpersons" do
      q = RentalProperty.filter_on_constraints(:maxpersons => 11)
      expect(q.length).to eq(1)
      q = RentalProperty.filter_on_constraints(:maxpersons => 12)
      expect(q.length).to eq(1)
      q = RentalProperty.filter_on_constraints(:maxpersons => 13)
      expect(q.length).to eq(0)
      q = RentalProperty.filter_on_constraints(:maxpersons => 8)
      expect(q.length).to eq(2)
    end

    it "should filter correctly on multiple constraints" do
      q = RentalProperty.filter_on_constraints(:pets_allowed => false,
         :maxpersons => 7, :beds => 2)
      expect(q.length).to eq(1)
    end

    it "should ignore invalid constraints" do
      q = RentalProperty.filter_on_constraints(:dogs_allowed => false,
         :people => 7, :pool_tables => 20)
      expect(q.length).to eq(3)
    end
  end
end
