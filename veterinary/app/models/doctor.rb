class Doctor < User
	has_one :address, foreign_key: "user_id"
	has_many :appointments
	has_many :customers, through: :appointments 

	accepts_nested_attributes_for :address

	
end	