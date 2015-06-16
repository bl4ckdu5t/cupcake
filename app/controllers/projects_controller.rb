class ProjectsController < ApplicationController
	before_action :authenticate_user!

  def index
  	render json: Project.where(user_id: current_user)
  end

  def new
  end
  
end
