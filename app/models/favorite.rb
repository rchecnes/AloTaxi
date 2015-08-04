class Favorite < ActiveRecord::Base
  #belongs_to :person
  belongs_to :address
  belongs_to :user
  validates :name ,presence: true
  #validates :person_id, presence: true
  validates :address_id, presence: true
  validates :user_id, presence: true
  
end
