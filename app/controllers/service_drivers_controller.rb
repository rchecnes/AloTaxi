class ServiceDriversController < ApplicationController
  before_action :set_service, only: [:accept]
 layout "administrator"
  
  
  
  
  def index
   
    @title = "Servicios por Atender"
    @services = Service.find_by(driver_id: '1')
   
  end
  
  def accept
   
    
       
  end
  
end 
