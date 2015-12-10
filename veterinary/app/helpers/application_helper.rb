module ApplicationHelper

	def user_display_name
		current_user.owner? ?  link_to(current_user.name, edit_owner_path(current_user.id)) : current_user.name 
	end	


end
