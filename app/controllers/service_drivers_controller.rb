class ServiceDriversController < ApplicationController
  before_action :set_service, only: [:accept]
 layout "administrator"
  
  
  
  
  
  
  
  def index
    @chofer =1
    @title = "Servicios por Atender"
    @services = Service.find(@chofer)
  end
  
  def Aceptar
   
    @title = "Servicios por Atender"
    @services = Service.find_by(driver_id: '1')
   
  end
  
  def accept
   
       
  end
  
end 
