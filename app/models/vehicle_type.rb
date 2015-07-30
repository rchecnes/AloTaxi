class VehicleType < ActiveRecord::Base
    has_many :services
    has_many :vehicles
end
