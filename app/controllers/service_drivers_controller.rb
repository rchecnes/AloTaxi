class ServiceDriversController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  layout "administrator"
  
  
  
  
  def index
    @chofer =1
    @title = "Servicios por Atender"
    @services = Service.find(@chofer)
  end
  
  def Aceptar
       
  end
  
end 
