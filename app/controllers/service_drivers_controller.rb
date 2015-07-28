class ServiceDriversController < ApplicationController
  before_action :set_service, only: [:accept]
 layout "administrator"
  
  
  
  
  
  
  
  def index
    
    @title = "Servicios por Atender"
    @services = Service.all
  end
  
  def Aceptar
   
    @title = "Servicios por Atender"
    @services = Service.all
   
  end
  
  def accept
   
       
  end
  
end 
