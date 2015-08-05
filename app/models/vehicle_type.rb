class VehicleType < ActiveRecord::Base
    has_many :services
    has_many :vehicles
    has_many :rates
end
