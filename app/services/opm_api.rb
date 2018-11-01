#services for openweathermap.org API
class OpmApi
    BASE = 'http://api.openweathermap.org/data/2.5'
    APPID = "4677e74e2adf88a8caa0f4daa7417f79"

    def self.connection
        Faraday.new(url: BASE)
    end

    def self.get_full_data(city_name)
        con = connection
        (con.get 'weather', {:q => city_name, :appid => APPID, :units => "metric"}).body
    end

    def self.get_temp(city_name)
        full_data = get_full_data(city_name)
        hash = JSON.parse full_data
        hash["main"]["temp"]
    end
end