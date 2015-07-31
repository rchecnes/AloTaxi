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
    @vehicles=Vehicle.all
  end
  
  def update
  end   
  
  def assign_vehicle
    
      respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'service  was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:id_vehicle)
    end

end  

 
    
