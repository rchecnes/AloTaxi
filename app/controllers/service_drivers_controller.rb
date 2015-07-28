class ServiceDriversController < ApplicationController
  before_action :set_service, only: [:accept, :reject,:start,:terminate]
 layout "administrator"
  
  def index

    @chofer=1
    @title = "Servicios Asignados"
    @services = Service.where(driver_id:@chofer)

  end
  
  def accept

    
  end
  
  def reject
  end 
    
  def start
  end
  
  def terminate
  end


  
end 
