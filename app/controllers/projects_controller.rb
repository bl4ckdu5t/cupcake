class ProjectsController < ApplicationController
	before_action :authenticate_user!

  def index
  	render json: Project.where(user_id: current_user)
  end

  def new
  	if params[:step] == '2'
  		render 'step2'
  	elsif params[:step] == '3'
  		render 'step3'
  	elsif params[:step] == '4'
  		render 'step4'
  	end
  end

  def step2

  end

  def step3

  end

  def step4

  end

  def create

  end

  def update
  	
  end
  
end
