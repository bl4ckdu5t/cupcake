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
    if params[:title].blank?
      render json: {'status' => 'The title can not be left blank'}
    else
      project = Project.new
      project.title = params[:title]
      project.stage = 3
      project.state = 'draft'
      project.design_type = params[:design_type]
      project.package = params[:package]
      project.user_id = current_user.id
      brief_data = brief_params.except('utf8', 'authenticity_token', 'title', 'commit', 'controller', 'action',
        'color1', 'color2', 'color3', 'design_type', 'package')
      brief_data[:color_choices] = ""
      (1..3).each { |x| brief_data[:color_choices] += params["color#{x}"]+':' }
      if project.save!
        brief_data[:project_id] = project.id
        Brief.new(brief_data).save!
        render json: {'status' => 'success'}
      end
    end
  end

  def edit
    
  end

  def update
  	
  end

  private

  def brief_params
    params.permit!
  end
  
end
