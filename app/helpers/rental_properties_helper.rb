require 'open-uri'
require 'json'

module RentalPropertiesHelper
  def geocode(address)
    uri = URI.parse("https://maps.googleapis.com/maps/api/geocode/json?address=#{address}")
    uri.open do |f|
      h = JSON.parse(f.read)
      if h['status'] == 'OK' and h['results'].length > 0
        lat = h['results'][0]['geometry']['location']['lat']
        lon = h['results'][0]['geometry']['location']['lng']
        return [lat.to_d, lon.to_d]
      end
    end
    return [nil, nil]
  end

  def geolocate(ipaddress)
    # don't even try localhost
    ip = ipaddress.to_s
    if ip.start_with? "127." or ip.start_with? "192.168" or ip.start_with? "10."
        return [nil, nil]
    end

    if location_cache.include? ipaddress.to_s
      return location_cache[ipaddress.to_s]
    end

    uri = URI.parse("https://freegeoip.net/json/#{ipaddress}")
    begin
      uri.open do |f|
        h = JSON.parse(f.read)
        result = [h['latitude'].to_d, h['longitude'].to_d]
        update_cache(ipaddress, result)
        return result
      end
    rescue
      return [nil, nil]
    end
  end

private
  def location_cache
    @cache || {}
  end

  def update_cache(ipaddr, result)
    location_cache[ipaddr.to_s] = result
  end
end
