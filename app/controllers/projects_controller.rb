class ProjectsController < ApplicationController
	before_action :authenticate_user!, except: [:show, :stream_api]

  def index
  	render json: Project.where(user_id: current_user).order(updated_at: :desc)
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
      project.duration = params[:duration]
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
    @project = Project.find(params[:id])
  end

  def update
    project = Project.find(params[:id])
    project.title = params[:project][:title]
    brief_data = brief_params.except('utf8','_method','authenticity_token','project','commit','controller','action','id','color1','color2',
      'color3')
    brief_data[:color_choices] = ""
    (1..3).each { |x| brief_data[:color_choices] += params["color#{x}"]+':' }
  	if project.save!
      brief = Brief.find_by(project_id: project.id)
      updated = brief.update_attributes(brief_data)
      if updated
        redirect_to :back, notice: 'Project successfully updated'
      end
    end
  end

  def show
    @project = Project.find(params[:id])
    @submissions = Submission.where(project_id: params[:id]).order(created_at: :desc)
    # Time difference between and now project creation in hours
    td = ((Time.now - @project.created_at) / 1.hour).round
    duration = @project.duration.blank? ? 0 : @project.duration
    # Total Hours
    th = duration.to_i * 24
    # Hours Left
    @hl = th - td
    # Days Left
    @dl = @hl / 24
  end

  def stream_api
    render json: Project.where(paid: true, state: 'open').order(created_at: :desc)
  end

  def selecting
    render json: { status: 'found'}
    # if Selection.exists?(designer_id: params[:designer], rank: params[:rank], project_id: params[:project])
    #   s = Selection.where(project_id: params[:project], designer_id: params[:designer])
    # else
    #   s = Selection.new
    # end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      redirect_to :back
    end
  end

  private

  def brief_params
    params.permit!
  end
  
end
