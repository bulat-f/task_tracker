class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :admin?,      only: [:edit, :update, :new, :create, :destroy]
  before_action :creater?,    only: [:edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = 'New project created'
      redirect_to @project
    else
      flash.now[:warning] = 'Project did not create'
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      flash[:success] = 'Project updated'
      redirect_to @project
    else
      flash.now[:warning] = 'Project did not update'
      render :edit
    end
  end

  def destroy
    if @project.destroy
      flash[:success] = 'Project deleted'
      redirect_to project_path
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end

  def set_project
    @project = Project.find_by_id(params[:id])
  end

  def creater?
    unless @project.creater?(current_user)
      flash[:warning] = 'You are not admin in this project'
      redirect_to root_path
    end
  end
end
