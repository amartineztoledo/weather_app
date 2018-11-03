class City < ApplicationRecord
    has_many :weathers

    validates :name, presence: true
    accepts_nested_attributes_for :weathers

    before_create :set_opm_id

    def self.update_temps
        #Get and store current temps for all cities
        opm_ids = self.all.collect{|city| city.opm_id}.compact.join(',')
        hash = OpmApi.several_cities_data(opm_ids)
        hash&.each do |opm_id,temp|
            city = City.find_by(opm_id: opm_id)
            weather = Weather.new(temp: temp)
            city.weathers << weather
        end
    end

    def set_opm_id
        #Get id used by opm for current city name
        opm_id = OpmApi.get_opm_id(self.name)
        self.opm_id = opm_id
    end
end
