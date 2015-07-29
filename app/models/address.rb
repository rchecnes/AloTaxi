class Address < ActiveRecord::Base
  belongs_to :district
  
  has_many :from_address_services ,  :foreign_key  =>  "from_address_id" ,  :class_name  =>  "Service" 
  has_many :to_address_services ,  :foreign_key  =>  "to_address_id" ,  :class_name  =>  "Service"
  
  def name
    description
  end

end
