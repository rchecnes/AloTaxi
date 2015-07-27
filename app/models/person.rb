class Person < ActiveRecord::Base

    has_many :favorites

    has_many :customer_services ,  :foreign_key  =>  "customer_id" ,  :class_name  =>  "Service" 
    has_many :driver_services ,  :foreign_key  =>  "driver_id" ,  :class_name  =>  "Service"

end
