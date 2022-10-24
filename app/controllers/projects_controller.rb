# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  after_action :set_project_enrollment, only: %i[edit update create]

  def index
    @projects = policy_scope(Project)
  end

  def show; end

  def new
    @project = Project.new
    authorize @project
  end

  def edit; end

  def create
    @project = current_user.projects.build(project_params)
    authorize @project

    if @project.save
      redirect_to project_url(@project)
      flash[:notice] = 'Project was successfully created.'
    else
      redirect_to new_project_path
      flash[:alert] = 'Project was not created.'
    end
  end

  def update
    if @project.update(project_params)
      redirect_to project_url(@project)
      flash[:notice] = 'Project was successfully updated.'
    else
      flash[:alert] = 'Project was not updated.'
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_url
      flash[:notice] = 'Project was successfully destroyed.'
    else
      flash[:alert] = 'Project was not destroyed.'
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end

  def project_enrollment_params
    params.require(:project).permit(:developer_id)
  end

  def set_project_enrollment
    @project.project_enrollments.create!(project_enrollment_params)
  end
end
