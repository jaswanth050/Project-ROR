class Appointment < ActiveRecord::Base

	belongs_to :doctor
	belongs_to :customer

	validates :visit_date, presence: true
	validates :pet, presence: true
	validates :customer_id, presence: true
	validates :reason, presence: true

	validate :valid_visit_date?

	def customer_name
		customer.try(:name)
	end	

	def doctor_name
		doctor.try(:name)
	end	

	private

	def valid_visit_date?
		if visit_date
			errors.add(:visit_date, "can't be past date") if visit_date.to_date < Date.today
		end	
	end	

end
