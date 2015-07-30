class ServiceOperatorsController < ApplicationController
before_action :set_service, only: [:assign_vehicle, :assign_driver, :update, :destroy]
  layout "administrator"
  # GET /services
  # GET /services.json
  def index
    @title = "Asignar Vehiculos a Servicios"
    @services = Service.all
    
  end
end
