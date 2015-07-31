class ServiceDriversController < ApplicationController
  before_action :set_service, only: [:accept, :reject,:start,:terminate]
 layout "administrator"
  
  def index

    @chofer=1
    @title = "Servicios Asignados"
    @services = Service.where(driver_id:@chofer)

  end
  
  def accept_service
   @id_service=params[:param]
   @service=Service.find(@id_service)
   @service.phase='AP'
   @service.save()
    
    redirect_to service_drivers_index_path
    
  end
  
  def reject_service
   @id_service=params[:param]
   @service=Service.find(@id_service)
   @service.phase='RE'
   @service.save()
    
    redirect_to service_drivers_index_path
  end 
    
  def start_service
   @id_service=params[:param]
   @service=Service.find(@id_service)
   @service.phase='ST'
   @service.save()
   redirect_to service_drivers_index_path
  end
  
  def terminate_service
   @id_service=params[:param]
   @service=Service.find(@id_service)
   @service.phase='TE'
   @service.save()
   redirect_to service_drivers_index_path
  end


  
end 
