class Service < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :service_type
  belongs_to :payment_type
  belongs_to :vehicle_type
  
  belongs_to :customer ,  :class_name  =>  "Person" 
  belongs_to :driver ,  :class_name  =>  "Person"
  
  belongs_to :from_address ,  :class_name  =>  "Address" 
  belongs_to :to_address ,  :class_name  =>  "Address"
  
  #validates :scheduled_to, presence: true
  validates :requested_seats, presence: true
  validates :vehicle_type, presence: true
  validates :payment_type, presence: true
  validates :price, presence: true
  validates :requested_seats, presence: true
end
