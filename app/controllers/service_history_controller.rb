class ServiceHistoryController < ApplicationController
  layout "administrator"
  before_filter :authenticate_user!
  def index
    @title="Service History"
    @user = User.find(current_user.id)
    @services=Service.where(customer:@user)
  end



    
end
