class AccountsController < ApplicationController
	before_action :authenticate_user!

	def designers

	end

	def customers
		if current_user.usertype == 'designer'
			redirect_to designer_path
		end
	end
end
