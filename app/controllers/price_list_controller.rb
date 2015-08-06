class PriceListController < ApplicationController
  layout "administrator"
  before_filter :authenticate_user!
  
  def index
    @title = "Price List"
    @prices = Rate.all
  end
end
