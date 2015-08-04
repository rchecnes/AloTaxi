class HomeController < ApplicationController
  def index
    
    redirect_to controller: :services , action: :index unless user_signed_in?
       
  
  end
end
