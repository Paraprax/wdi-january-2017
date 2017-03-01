class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.all
    @projects = @projects.order(:end_date)
  end

  def new
    @project = Project.new
    @project.rewards.build
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to project_url
    else
      render :new
    end
   end

  private
  def project_params
    params.require(:project).permit(:title, :description, :goal, :start_date, :end_date, :image, rewards_attributes: [:dollar_amount, :_destroy])
  end
end
