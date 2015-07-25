class AccountsController < ApplicationController
	before_action :authenticate_user!
	before_filter :init

	def designers
		session[:usertype] = 'designer'
    if current_user.usertype == 'customer'
    	redirect_to customer_path
    end
    @submissions_count = Submission.where(designer_id: current_user.id).count
    @notification_presence = Notification.where(user_id: current_user.id, seen: false)
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

	def notifications
		@notifications.update_all(seen: true)
	end

	private

	def init
    @notifications = Notification.where(user_id: current_user.id).order(updated_at: :desc)
	end
end
