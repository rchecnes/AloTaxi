class ServiceDriversController < ApplicationController
  before_action :set_service, only: [:accept, :reject,:start,:terminate]
 layout "administrator"
 before_filter :authenticate_user!
  
  def index

    @title = "Assigned Services"
    @services = Service.where(driver_id:current_user.id)

  end
  
  def accept_service
   @id_service=params[:param]
   @service=Service.find(@id_service)
   @service.phase='Accepted'
   @service.save()
    
    respond_to do |format|
      format.html { redirect_to service_drivers_index_path, notice: 'Update service '+@service.id.to_s + 'phase Accepted .' }
      format.json { head :no_content }
     end
    
    
    
  end
  
  def reject_service
   @id_service=params[:param]
   @service=Service.find(@id_service)
   @service.phase='Rejected'
   @service.save()
    
    respond_to do |format|
      format.html { redirect_to service_drivers_index_path, notice: 'Update service'+@service.id.to_s+ ' phase Rejected .' }
      format.json { head :no_content }
     end
    
  end 
    
  def start_service
   @id_service=params[:param]
   @service=Service.find(@id_service)
   @service.phase='Started'
   @service.save()
   
   respond_to do |format|
      format.html { redirect_to service_drivers_index_path, notice: 'Update service ' +@service.id.to_s+ ' phase Started .' }
      format.json { head :no_content }
     end
   
  end
  
  def terminate_service
   @id_service=params[:param]
   @service=Service.find(@id_service)
   @service.phase='Terminated'
   @service.save()
   
   respond_to do |format|
      format.html { redirect_to service_drivers_index_path, notice: 'Update service '+@service.id.to_s+' phase Terminated .' }
      format.json { head :no_content }
   end
  end


  
end 
