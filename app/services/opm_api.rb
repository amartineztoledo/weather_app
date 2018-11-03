#services for openweathermap.org API
class OpmApi
    BASE = 'http://api.openweathermap.org/data/2.5'
    APPID = ENV['APPID']

    def self.connection
        Faraday.new(url: BASE)
    end

    def self.get_full_data(city_name)
        #get data by city name
        con = connection
        full_data = (con.get 'weather', {:q => city_name, :appid => APPID, :units => "metric"}).body
        JSON.parse full_data
    end

    def self.get_temp(city_name)
        #get temp by city name
        hash = get_full_data(city_name)
        hash["main"]["temp"]
    end

    def self.get_opm_id(city_name)
        #get id used by opm given city name
        hash = get_full_data(city_name)
        hash["id"]
    end

    def self.several_cities_data(opm_ids)
        #get data for several ids of cities 
        con = connection
        several_cities_data = (con.get 'group', {:id => opm_ids, :appid => APPID, :units => "metric"}).body
        data_hash = JSON.parse several_cities_data
        cities_temps = Hash.new
        data_hash["list"]&.each do |data|
            opm_id = data["id"]
            temp = data["main"]["temp"]
            cities_temps[opm_id] = temp
        end
        cities_temps

    end
end