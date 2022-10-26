# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

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
      set_project_enrollment
      flash[:notice] = 'Project was successfully created.'
      render :show
    else
      flash[:alert] = 'Project was not created.'
      render :new
    end
  end

  def update
    if @project.update(project_params)
      set_project_enrollment
      flash[:notice] = 'Project was successfully updated.'
      render :show
    else
      flash[:alert] = 'Project was not updated.'
      render :edit
    end
  end

  def destroy
    if @project.destroy
      flash[:notice] = 'Project was successfully destroyed.'
      render :index
    else
      flash[:alert] = 'Project was not destroyed.'
      render :show
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
    @project.project_enrollments.create(project_enrollment_params)
  end
end
