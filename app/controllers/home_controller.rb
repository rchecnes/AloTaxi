class HomeController < ApplicationController
  def index
    
    #Admin redirige = menu_roles
    #Operario redirige = service_operators
    #Taxista redirige = service_drivers
    #Cliente redirige = favorites
    
    if user_signed_in?
      @controller = "services";
      
      if current_user.role.id == 1
        redirect_to controller: :menu_roles , action: :index
      end
      
      if current_user.role.id == 2
        redirect_to controller: :service_operators , action: :index
      end
      
      if current_user.role.id == 3
        redirect_to controller: :service_drivers , action: :index
      end
      
      if current_user.role.id == 4
        redirect_to controller: :favorites , action: :index
      end
    else
      redirect_to user_session_path
    end 

    #redirect_to controller: :controller , action: :index unless user_signed_in?
    
  end
end
