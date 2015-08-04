class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  layout "administrator"
  before_filter :authenticate_user!
  # GET /services
  # GET /services.json
  def index
    @title = "Taxi booking service"
    #@services = Service.all
    @service_type = ServiceType.find(2)
    @services = Service.where(service_type:@service_type, customer:current_user.id)
    
  end
  
  def list_favorite
    @address_type = params[:address_type]    
    #respond_to do |format|
    #  format.html
    #  format.js
    #end
        
    @favorites = Favorite.where(user:current_user.id)
  end
  
  def calculate_price
 
   #@from_district=params[:param1]
   #@to_district=params[:param2]
   #@vehicle_type=params[:param3]
   #@price= Rate.where(from_district_id:@from_district ,to_district_id:@to_district ,vehicle_type_id:@vehicle_type )
   @data =20
  #redirect_to new_service_path
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @title = "New Taxi booking service"
    @service = Service.new
    @districts = District.all
  end

  # GET /services/1/edit
  def edit
    @title = "Edit Taxi booking service"
    @districts = District.all
  end

  # POST /services
  # POST /services.json
  def create
    #@service = Service.new(service_params)
  
    #respond_to do |format|
    #  if @service.save
    #    format.html { redirect_to @service, notice: 'Service was successfully created.' }
    #    format.json { render :show, status: :created, location: @service }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @service.errors, status: :unprocessable_entity }
    #  end
    #end
    
    
    
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
      
      #insert to address
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
        
      #se calculara precio
      
      @rate= Rate.where(from_district_id:1  ,to_district_id:1 ,vehicle_type_id:1).first
      
      #insert to services
     
      @service = Service.new
      
      @service.scheduled_to = service_params[:scheduled_to]
      @service.requested_seats=service_params[:requested_seats]
      @service.vehicle_type_id = service_params[:vehicle_type_id]
      @service.payment_type_id = service_params[:payment_type_id]
      @service.price = @rate.price unless @rate.nil?
      @service.service_type_id = 2
      @service.phase = 'Evaluated'
      @service.from_address = @from_address
      @service.to_address = @to_address
      @service.customer_id = current_user.id
      
      #@service.save
      
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
      
      if @service.save
        #format.html { redirect_to controller: "services", action: "index" }
        format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
        format.json { head :no_content }
      else
        @title = "New inmediate service"
        @districts = District.all
        
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
    
    
    
    
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
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
end
