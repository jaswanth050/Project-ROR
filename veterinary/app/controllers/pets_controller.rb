class PetsController < ApplicationController

  before_filter :authenticate, :authorize
  	 
  def index
  	@pets = Pet.where(doctor_id: current_user.id).includes(:customer)
  end

  def new
  	@pet = Pet.new
  end
  
  def create
  	@pet = Pet.new(pet_params.merge(doctor_id: current_user.id))
  	if @pet.save
  		redirect_to pets_path
  	else
  		render new_pet_path
  	end	
  end

  def edit
  	@pet = Pet.find(params[:id])
  end

  def update
  	@pet = Pet.find(params[:id])
  	if @pet.update_attributes(pet_params)
  		redirect_to pets_path
  	else
  		render :edit
  	end	
  end	

  def show
  end

  private

  def pet_params
      params.require(:pet).permit!
  end

  def authorize
  	redirect_to root_path unless current_user.doctor?
  end	


end
