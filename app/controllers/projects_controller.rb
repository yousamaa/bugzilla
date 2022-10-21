# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = Project.all
  end

  def show; end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to project_url(@project)
      flash[:notice] = 'Project was successfully created.'
    else
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
  end

  def project_params
    params.require(:product).permit(:title, :description)
  end
end
