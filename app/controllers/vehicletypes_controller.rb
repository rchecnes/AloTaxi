class VehicletypesController < ApplicationController
  before_action :set_vehicletype, only: [:show, :edit, :update, :destroy]

  # GET /vehicletypes
  # GET /vehicletypes.json
  def index
    @vehicletypes = Vehicletype.all
  end

  # GET /vehicletypes/1
  # GET /vehicletypes/1.json
  def show
  end

  # GET /vehicletypes/new
  def new
    @vehicletype = Vehicletype.new
  end

  # GET /vehicletypes/1/edit
  def edit
  end

  # POST /vehicletypes
  # POST /vehicletypes.json
  def create
    @vehicletype = Vehicletype.new(vehicletype_params)

    respond_to do |format|
      if @vehicletype.save
        format.html { redirect_to @vehicletype, notice: 'Vehicletype was successfully created.' }
        format.json { render :show, status: :created, location: @vehicletype }
      else
        format.html { render :new }
        format.json { render json: @vehicletype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicletypes/1
  # PATCH/PUT /vehicletypes/1.json
  def update
    respond_to do |format|
      if @vehicletype.update(vehicletype_params)
        format.html { redirect_to @vehicletype, notice: 'Vehicletype was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicletype }
      else
        format.html { render :edit }
        format.json { render json: @vehicletype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicletypes/1
  # DELETE /vehicletypes/1.json
  def destroy
    @vehicletype.destroy
    respond_to do |format|
      format.html { redirect_to vehicletypes_url, notice: 'Vehicletype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicletype
      @vehicletype = Vehicletype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicletype_params
      params.require(:vehicletype).permit(:name, :description)
    end
end
