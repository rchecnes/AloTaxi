class District < ActiveRecord::Base
    has_many :addresses
  validates :name, presence: true
  validates :description, presence: true
   
   
end
