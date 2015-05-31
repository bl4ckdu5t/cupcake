class AccountsController < ApplicationController
	before_action :authenticate_user!

	def designers
    if current_user.usertype == 'customer'
    	redirect_to customer_path
    end
	end

	def customers
		if current_user.usertype == 'designer'
			redirect_to designer_path
		end
	end
end
