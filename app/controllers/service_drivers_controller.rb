class ServiceDriversController < ApplicationController
  before_action :set_service, only: [:accept, :reject,:start,:terminate]
 layout "administrator"
  
  def index

    @chofer=1
   
    @title = "Assigned Services"
    @services = Service.where(driver_id:@chofer)

  end
  
  def accept_service
   @id_service=params[:param]
   @service=Service.find(@id_service)
   @service.phase='Accepted'
   @service.save()
    
    redirect_to service_drivers_index_path
    
  end
  
  def reject_service
   @id_service=params[:param]
   @service=Service.find(@id_service)
   @service.phase='Rejected'
   @service.save()
    
    redirect_to service_drivers_index_path
  end 
    
  def start_service
   @id_service=params[:param]
   @service=Service.find(@id_service)
   @service.phase='Started'
   @service.save()
   redirect_to service_drivers_index_path
  end
  
  def terminate_service
   @id_service=params[:param]
   @service=Service.find(@id_service)
   @service.phase='Terminated'
   @service.save()
   redirect_to service_drivers_index_path
  end


  
end 
