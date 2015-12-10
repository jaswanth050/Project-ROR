class Pet < ActiveRecord::Base

	PET_TYPES = %w(dog cat bird)

	belongs_to :doctor
	belongs_to :customer

	validates :name,:age, :weight, :doctor_id, :last_visit, :customer_id, :breed, presence: true
	validates :name, :breed, length: { maximum: 35 }	
	validates :age, :weight, numericality: true
	
	validates :type_of_pet, inclusion: { in: PET_TYPES }
	validate :valid_last_visit?

	def customer_name
		customer.try(:name)
	end	

	private

	def valid_last_visit?
		if last_visit
			errors.add(:last_visit, "can't be future date") if last_visit.to_date > Date.today
		end	
	end	
end
