class DoctorsController < ApplicationController

  before_filter :authenticate, :authorize
  	 
  def index
  	@doctors = Doctor.all.includes(:address)
  end

  def new
  	@doctor = Doctor.new
  	@doctor.build_address
  end
  
  def create
  	@doctor = Doctor.new(doctor_params)
  	if @doctor.save
  		redirect_to doctors_path
  	else
  		render new_doctor_path
  	end	
  end

  def edit
  	@doctor = Doctor.find(params[:id])
  end

  def update
  	@doctor = Doctor.find(params[:id])
  	if @doctor.update_attributes(doctor_params)
  		redirect_to doctors_path
  	else
  		render :edit
  	end	
  end	

  def show
  end

  private

  def doctor_params
      params.require(:doctor).permit(:name, address_attributes: [ :address, :city, :state, :zip, :degree_from, :experience ])
  end

  def authorize
  	redirect_to root_path unless current_user.owner?
  end	

end
