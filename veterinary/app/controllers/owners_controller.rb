class OwnersController < ApplicationController

  before_filter :authenticate, :authorize
  

  def edit
  	@owner = Owner.find(params[:id])
  	@owner.build_address unless @owner.address
  end

  def update
  	@owner = Owner.find(params[:id])
  	if @owner.update_attributes(owner_params)
  		redirect_to root_path
  	else
  		render :edit
  	end	
  end	

  private

  def owner_params
      params.require(:owner).permit(:name, address_attributes: [ :address, :city, :state, :zip, :degree_from, :experience ])
  end

  def authorize
  	redirect_to root_path unless current_user.owner?
  end	
end
