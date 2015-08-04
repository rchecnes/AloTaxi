class ServiceOperatorsController < ApplicationController
  
  layout "administrator"
  before_filter :authenticate_user!
  # GET /services
  # GET /services.json
   def index
    @title = "Assign vehicles to services"
   
    @services = Service.all
   end
  
  def list_driver
    @people=Person.all
    @service = Service.find(params[:id])
  end
  
  def list_vehicle
    @vehicles = Vehicle.all
    @service = Service.find(params[:id])
  end
  
  
 
  def assign_vehicle
    
   @service=Service.find(params[:param1])
   @service.update_attributes(:vehicle_id => params[:param2])
  end
   

  def assign_driver
    
   @service=Service.find(params[:param1])
   @service.update_attributes(:driver_id => params[:param2])
  redirect_to service_operators_index_path
   
  end
  
  def confirm_assigned
     @service=Service.find(params[:param])
     @service.update_attributes(:phase => "Asigned")
     
     respond_to do |format|
      format.html { redirect_to service_operators_index_path, notice: 'service '+@service.id.to_s + ' assigned  successfully .' }
      format.json { head :no_content }
     end
     
     
  end

end  

 
    
