class CustomersController < ApplicationController

  before_filter :authenticate, :authorize
  	
  def index
  	
  end

   private

 
  def authorize
  	redirect_to root_path unless current_user.customer?
  end	
end
