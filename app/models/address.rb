class Address < ActiveRecord::Base
  belongs_to :district
  has_many :to_address_services ,  :foreign_key  =>  "customer_id" ,  :class_name  =>  "Service" 
  has_many :from_address_services ,  :foreign_key  =>  "driver_id" ,  :class_name  =>  "Service"
  
  def name
    description
  end

end
