class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :favorites
  belongs_to :role
    
  has_many :customer_services ,  :foreign_key  =>  "customer_id" ,  :class_name  =>  "Service" 
  has_many :driver_services ,  :foreign_key  =>  "driver_id" ,  :class_name  =>  "Service"
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dni, presence: true
  
  before_create :assign_default_role

  
  def name
      first_name + " " + last_name
  end
  
  #Roles
  #1:Admin
  #2:Operario
  #3:Taxista
  #4:Cliente
  
  def assign_default_role
    self.role = Role.find(1)
  end
  
  
    
end
