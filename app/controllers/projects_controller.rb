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
        'color1', 'color2', 'color3', 'design_type', 'package', 'duration')
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
    if current_user.id == project.user_id
      project.title = params[:project][:title]
      brief_data = brief_params.except('utf8','_method','authenticity_token','project','commit','controller','action','id','color1','color2',
        'color3')
      brief_data[:color_choices] = ""
      if params[:color1].present?
        (1..3).each { |x| brief_data[:color_choices] += params["color#{x}"]+':' }
      end
    	if project.save!
        brief = Brief.find_by(project_id: project.id)
        updated = brief.update_attributes(brief_data)
        if updated
          redirect_to :back, notice: 'Project successfully updated'
        end
      end
    else
      redirect_to :back, notice: 'You have no access to this project'
    end
  end

  def show
    @project = Project.find(params[:id])
    @brief = Brief.find_by(project_id: params[:id])
    @submissions = Submission.where(project_id: params[:id]).order(created_at: :desc)
    @submission = Submission.new
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
    unless Selection.exists?(designer_id: params[:designer], project_id: params[:project])
      s = Selection.new
    end
    s.project_id = params[:project]
    s.designer_id = params[:designer]
    s.customer_id = params[:customer]
    s.rank = params[:rank]
    if s.save!
      Notification.new({sender_id: s.project_id, receiver_id: s.designer_id, message: "Your design was ranked #{s.rank}"}).save
      render json: { status: 'success' }
    end
  end

  def submission
    s = Submission.new(submission_params)
    if s.save
      redirect_to :back, notice: 'Your design has been submitted'
    else
      redirect_to :back, notice: 'Your design failed to submit. Check to ensure you are using a valid file format'
    end
  end

  def update_selecting
    s = Selection.find_by(project_id: params[:project], designer_id: params[:designer])
    s.rank = params[:rank]
    if s.save!
      Notification.new({sender_id: s.project_id, receiver_id: s.designer_id, message: "Your design was ranked #{s.rank}"}).save
      render json: { status: 'success' }
    end
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

  def submission_params
    params.require(:submission).permit!
  end
  
end
