class MenuRole < ActiveRecord::Base
  belongs_to :role
  
  validates :name, presence: true
  #validates :icon, presence: true
  validates :link, presence: true
  validates :role, presence: true
end
