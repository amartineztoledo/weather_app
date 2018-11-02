class City < ApplicationRecord
    has_many :weathers
    accepts_nested_attributes_for :weathers

    def self.update_temps
        #get and store current temps for all cities
        opm_ids = self.all.collect{|city| city.opm_id}.join(',')
        hash = OpmApi.several_cities_data(opm_ids)
        hash.each do |opm_id,temp|
            city = City.find_by(opm_id: opm_id)
            weather = Weather.new(temp: temp)
            city.weathers << weather
        end
    end
end
