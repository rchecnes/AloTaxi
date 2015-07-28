class Person < ActiveRecord::Base


    has_many :favorites

    has_many :to_services ,  :foreign_key  =>  "to_address_id" ,  :class_name  =>  "Service" 
    has_many :from_services ,  :foreign_key  =>  "from_address_id" ,  :class_name  =>  "Service"
end
