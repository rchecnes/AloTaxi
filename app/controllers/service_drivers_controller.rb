class ServiceDriversController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  layout "administrator"
  
  def index
    @title = "Servicios por Atender"
    @services = Service.all
  end
end
