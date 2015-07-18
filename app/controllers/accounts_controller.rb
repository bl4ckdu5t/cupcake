class AccountsController < ApplicationController
	before_action :authenticate_user!

	def designers
		session[:usertype] = 'designer'
    if current_user.usertype == 'customer'
    	redirect_to customer_path
    end
    @projects = Project.all
    @recommended = Project.where(design_type: current_user.specialty)
	end

	def customers
		session[:usertype] = 'customer'
		if current_user.usertype == 'designer'
			redirect_to designer_path
		end
	end

	def choice
		if current_user.usertype == 'designer' or session[:usertype] == 'designer'
			redirect_to designer_path
		elsif current_user.usertype == 'customer' or session[:usertype] == 'customer'
			redirect_to customer_path
		end
	end

	def calvary
		u = User.find(current_user.id)
		u.usertype = 'both'
		if u.save!
			render json: {status: 'success'}
		else
			render json: {status: 'failed'}
		end
	end
end
