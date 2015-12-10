class Customer < User

	has_many :appointments
	
	def next_appointments
	  appointments.where("appointments.visit_date >= #{Date.today}" ) 
	end 

end	