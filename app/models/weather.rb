class Weather < ApplicationRecord
  belongs_to :city
  validates :temp, numericality: { greater_than: -100, less_than: 100 }
 

  paginates_per 5
end
