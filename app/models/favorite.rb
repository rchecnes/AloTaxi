class Favorite < ActiveRecord::Base
  belongs_to :person
  belongs_to :address
  validates :name ,presence: true
  validates :person_id, presence: true
  validates :address_id, presence: true
  
end
