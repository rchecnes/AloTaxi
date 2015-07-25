class Service < ActiveRecord::Base
  belongs_to :person
  belongs_to :person
  belongs_to :payment_type
  belongs_to :vehicle
  belongs_to :service_type
  belongs_to :address
  belongs_to :address
end
