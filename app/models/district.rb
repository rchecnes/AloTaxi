class District < ActiveRecord::Base
  has_many :addresses
  has_many :from_district_rate ,  :foreign_key  =>  "from_district_id" ,  :class_name  =>  "Rate" 
  has_many :to_address_rate ,  :foreign_key  =>  "to_district_id" ,  :class_name  =>  "Rate"
  validates :name, presence: true
  validates :description, presence: true
  
   
end
