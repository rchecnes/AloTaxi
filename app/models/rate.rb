class Rate < ActiveRecord::Base
  belongs_to :from_district , :class_name => "District"
  belongs_to :to_district , :class_name => "District"
  belongs_to :service_type
end
