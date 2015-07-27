class Service < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :service_type
  belongs_to :payment_type
  
  belongs_to :person
  belongs_to :person
  belongs_to :address
  belongs_to :address
  
  belongs_to :customer ,  :class_name  =>  "Person" 
  belongs_to :driver ,  :class_name  =>  "Person"
  
  belongs_to :to_address ,  :class_name  =>  "Address" 
  belongs_to :from_address ,  :class_name  =>  "Address"
end
