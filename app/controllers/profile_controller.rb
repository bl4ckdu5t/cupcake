class ProfileController < ApplicationController
	before_action :authenticate_user!, except: [:show]
	def edit
		@settings = User.find(current_user.id)
	end

	def update
		@settings = User.find(current_user.id)
		updated = @settings.update_attributes(settings_params)
		if updated
			redirect_to :back, notice: 'Profile preferences updated'
		else
			redirect_to :back, notice: 'Profile update failed'
		end
	end

	def show

	end

	private

	def settings_params
		params.require(:user).permit!
	end
end
