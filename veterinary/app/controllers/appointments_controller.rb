class AppointmentsController < ApplicationController

  before_filter :authenticate, :authorize
  	 
  def index
  	@appointments = Appointment.all.includes(:customer, :doctor)
  end

  def new
  	@appointment = Appointment.new
  end
  
  def create
  	customer = Customer.find_or_create_by(name: params[:appointment][:customer_name])
  	@appointment = Appointment.new(appointment_params.merge(customer_id: customer.id))
  	if @appointment.save
  		redirect_to appointments_path
  	else
  		render new_appointment_path
  	end	
  end

  def edit
  	@appointment = Appointment.find(params[:id])
  end

  def update
  	@appointment = Appointment.find(params[:id])
  	if @appointment.update_attributes(appointment_params)
  		redirect_to appointments_path
  	else
  		render edit_appointment_path(@appointment.id)
  	end	
  end	

  def show
  end

  private

  def appointment_params
      params.require(:appointment).permit(:visit_date, :pet, :customer_id, :send_reminder, :reason, :doctor_id)
  end

  def authorize
  	redirect_to root_path unless current_user.receptionist?
  end	
end
