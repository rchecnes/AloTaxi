class ServiceOperatorsController < ApplicationController
  
  layout "administrator"
  # GET /services
  # GET /services.json
   def index
    @title = "Asignar Vehiculos a Servicios"
    @services = Service.all
   end
  
  def list_driver
    @drivers=Driver.all
  end
  
  def list_vehicle
    @vehicles = Vehicle.all
    @service = Service.find(params[:id])
  end
  
  def update
  end   
  
  def assign_vehicle
    
   @service=Service.find(params[:param1])
   @service.update_attributes(:vehicle_id => params[:param2])
  redirect_to service_operators_index_path
   
  end
  


end  

 
    
