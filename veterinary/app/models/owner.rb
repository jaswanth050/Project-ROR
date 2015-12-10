class Owner < User
	has_one :address, foreign_key: "user_id"
	accepts_nested_attributes_for :address
	
	def home_path
		
	end	
	
end	