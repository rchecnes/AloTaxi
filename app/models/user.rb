class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :favorites
    
  has_many :customer_services ,  :foreign_key  =>  "customer_id" ,  :class_name  =>  "Service" 
  has_many :driver_services ,  :foreign_key  =>  "driver_id" ,  :class_name  =>  "Service"
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dni, presence: true
  validates :license, presence: true
  
  def name
      first_name + " " + last_name
  end
    
end
