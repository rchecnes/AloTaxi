class Vehicle < ActiveRecord::Base
  belongs_to :vehicle_type
  has_many :services
  
  validates :plate, length: { in: 1..7 , message: "debe tener entre 1 y 7 caracteres"}
  validates :soat, numericality: { only_integer: true }
  validates :seats_capacity, numericality: { only_integer: true }
  validates :year, numericality: { only_integer: true }
  
end
