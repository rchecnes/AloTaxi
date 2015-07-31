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

end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:phase, :reserved_at, :confirmed_at, :cancelled_at, :scheduled_to, :requested_seats, :started_at, :ended_at, :price, :vehicle_id, :service_type_id, :payment_type_id, :customer_id, :driver_id, :from_address_id, :to_address_id, :vehicle_type_id)
    end
  