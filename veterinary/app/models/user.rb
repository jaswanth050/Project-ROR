class User < ActiveRecord::Base

	validates :name, presence: true
	validates :name, uniqueness: true

	def authenticate(password)
		password == PASSWORD
	end	

	def owner?
		type == "Owner"
	end

	def customer?
		type == "Customer"
	end

	def doctor?
		type == "Doctor"
	end

	def receptionist?
		type == "Receptionist"
	end	
end
