class ServiceOperatorsController < ApplicationController
  
  layout "administrator"
  before_filter :authenticate_user!
  # GET /services
  # GET /services.json
   def index
    @title = "Assign vehicles to services"
   
    @services = Service.all
   end
  
  def list_driver
      @service = Service.find(params[:id])
        #@user=User.joins('LEFT JOIN services ON services.driver_id = users.id')
        #.select('users.*').where('users.role_id=3 and services.phase!="Started"')
      @user=User.where("role_id=3 and 
                         users.id not in (select distinct services.driver_id from  services
                                          where phase !='Started' and 
      (services.driver_id is not null and services.vehicle_id is not null)  )") 
    #@user=User.where("role_id=3")
    
  end
  
  def list_vehicle
    @service = Service.find(params[:id])
    @vehicles =Vehicle.where("id not in 
                            (select distinct vehicle_id from services 
                             where phase!='Started' and 
                                   vehicle_id is not null) and seats_capacity=?",@service.requested_seats)
   
   
    
    
    
    
  end
  
  
 
  def assign_vehicle
    
   @service=Service.find(params[:param1])
   @service.update_attributes(:vehicle_id => params[:param2])
    redirect_to service_operators_index_path
  end
   

  def assign_driver
    
   @service=Service.find(params[:param1])
   @service.update_attributes(:driver_id => params[:param2])
  redirect_to service_operators_index_path
   
  end
  
  def confirm_assigned
     @service=Service.find(params[:param])
     @message=""   
      if (@service.phase=='Asigned' or @service.phase=='Rejected' )
          @phase='Evaluated'
          @message=" Delete Asigned successfully"
          @service.update_attributes(:phase => @phase ,:vehicle_id => nil , :driver_id =>nil)
       else
          @phase='Asigned'
          @message=" Asigned successfully"
          @service.update_attributes(:phase => @phase)
      end 
     
     
     respond_to do |format|
      format.html { redirect_to service_operators_index_path, notice: 'service '+@service.id.to_s  + @message }
      format.json { head :no_content }
     end
     
  def delete_assigned
   @service=Service.find(params[:param])
   @serivice.update_attributes(:phase => "evaluated",vehicle_id=>nil, driver_id=>nil )
   
   respond_to do |format|
      format.html { redirect_to service_operators_index_path, notice: 'service '+@service.id.to_s + ' Confirm delete Assigned .' }
      format.json { head :no_content }
     end
   
  end 
     
     
     
  end

end  

 
    
