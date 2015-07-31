class ServiceOperatorsController < ApplicationController
  before_action :set_service, only: [ :show, :edit, :update, :destroy]
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
    
   @id_vehicle=params[:param2]
   @id_service=params[:param1]
   @service=Service.find(@id_service)
   @service.vehicle_id=@id_vehicle
   @service.save()
   
  redirect_to service_operators_index_path
   
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
   

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:id_vehicle)
    end

end  

 
    
