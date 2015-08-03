class InmediateServicesController < ApplicationController
  before_action :set_inmediate_service, only: [:show, :edit, :update, :destroy]
  layout "administrator"
  before_filter :authenticate_user!
  # GET /inmediate_services
  # GET /inmediate_services.json
  def index
    @title = "Taxi rank"
    @service_type = ServiceType.find(1)
    @inmediate_services = Service.where(service_type:@service_type, customer:current_user.id)
  end

  # GET /inmediate_services/1
  # GET /inmediate_services/1.json
  def show
  end

  # GET /inmediate_services/new
  def new
    @title = "New taxi rank"
    @districts = District.all
    @inmediate_service = Service.new
  end

  # GET /inmediate_services/1/edit
  def edit
  end

  # POST /inmediate_services
  # POST /inmediate_services.json
  def create
    respond_to do |format|
      
      
      
      
      #insert from address
      if params[:from_address_two_id] != ""
        @from_address = Address.find(params[:from_address_two_id])
      else
        @from_address = Address.new
        @from_address.description = params[:from_address_two]
        @from_address.state = 1
        @from_address.reference = params[:from_reference_two]
        @from_address.district_id = params[:from_district_two]
        @from_address.save
      end
      
      #insert from address
      if params[:to_address_two_id] != ''
        @to_address = Address.find(params[:to_address_two_id])
      else
        @to_address = Address.new
        @to_address.description = params[:to_address_two]
        @to_address.state = 1
        @to_address.reference = params[:to_reference_two]
        @to_address.district_id = params[:to_district_two]
        @to_address.save
      end
        
      #insert to services
      @inmediate_service = Service.new
      
      #@service.scheduled_to = service_params[:scheduled_to]
      @inmediate_service.requested_seats=service_params[:requested_seats]
      @inmediate_service.vehicle_type_id = service_params[:vehicle_type_id]
      @inmediate_service.payment_type_id = service_params[:payment_type_id]
      @inmediate_service.price = service_params[:price]
      @inmediate_service.service_type_id = 1
      @inmediate_service.phase = 'Evaluated'
      @inmediate_service.from_address = @from_address
      @inmediate_service.to_address = @to_address
      @inmediate_service.customer_id = current_user.id
      #@inmediate_service.save
      
      #insert favorite from address
      @favorite_from_address = Favorite.find_by(address:@from_address);
      
      if @favorite_from_address
      else
        @favorite_from_address = Favorite.new
        @favorite_from_address.name = "Sin nombre"
        @favorite_from_address.user_id = current_user.id
        @favorite_from_address.address = @from_address
        @favorite_from_address.save
      end
      
      #insert favorite to address
      @favorite_to_address = Favorite.find_by(address:@to_address);
      
      if @favorite_to_address
      else
        @favorite_to_address = Favorite.new
        @favorite_to_address.name = "Sin nombre"
        @favorite_to_address.user_id = current_user.id
        @favorite_to_address.address = @to_address
        @favorite_to_address.save
      end
      
      if @inmediate_service.save
        format.html { redirect_to inmediate_services_url, notice: 'Service was successfully destroyed.' }
        format.json { head :no_content }
      else
        @title = "New taxi rank"
        @districts = District.all
        
        format.html { render :new }
        format.json { render json: @inmediate_service.errors, status: :unprocessable_entity }
      end
      
    end
  end

  # PATCH/PUT /inmediate_services/1
  # PATCH/PUT /inmediate_services/1.json
  def update
    respond_to do |format|
      if @inmediate_service.update(inmediate_service_params)
        format.html { redirect_to @inmediate_service, notice: 'Inmediate service was successfully updated.' }
        format.json { render :show, status: :ok, location: @inmediate_service }
      else
       
        format.html { render :edit }
        format.json { render json: @inmediate_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @inmediate_service.destroy
    respond_to do |format|
      format.html { redirect_to inmediate_services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inmediate_service
      @inmediate_service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
    
      #params.require(:inmediate_service).permit(:name)
      params.require(:service).permit(:phase, :reserved_at, :confirmed_at, :cancelled_at, :scheduled_to, :requested_seats, :started_at, :ended_at, :price, :vehicle_id, :service_type_id, :payment_type_id, :customer_id, :driver_id, :from_address_id, :to_address_id, :vehicle_type_id)
    end
end
