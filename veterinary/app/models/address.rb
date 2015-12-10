class Address < ActiveRecord::Base

	belongs_to :user

	validates :zip, length: { maximum: 5 }
	validates :experience, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 100 }
end
