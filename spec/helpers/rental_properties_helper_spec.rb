require 'rails_helper'

RSpec.describe RentalPropertiesHelper, type: :helper do
  describe "geocode method tests" do
    it "should return nil on a bad address" do
      result = geocode("!.!")
      expect(result).to match_array([nil, nil])
    end

    it "should geocode postcode CF14 3AS correctly and consistently" do
      lat, lng = geocode("CF14 3AS")
      expect(lat).to be_within(0.000001).of(51.4974098)
      expect(lng).to be_within(0.000001).of(-3.1967231)
    end
  end

  describe "geolocate" do
      it "should return nil,nil for localhost" do
          result = geolocate("127.0.0.1")
          expect(result).to match_array([nil,nil])
      end

      it "should gracefully handle bad ip addresses" do
          result = geolocate("....")
          expect(result).to match_array([nil,nil])
      end
  end
end
