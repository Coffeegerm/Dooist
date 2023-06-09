class Api::ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    render json: @projects, status: :ok
  end

  def show
    render json: @project, status: :ok
  end

  def show_todos
    @project = Project.find(params[:id])
    @todos = @project.todo_items
    render json: @todos, status: :ok
  end

  def create
    @project = Project.new(create_project_params)
    if @project.save
      render json: @project, status: :created
    else
      render json: { errors: @project.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(update_project_params)
      render json: @project, status: :ok
    else
      render json: { errors: @project.errors }, status: :unprocessable_entity
    end
  end

  private def create_project_params
    params.require(:project).permit(:name)
  end

  private def update_project_params
    params.require(:project).permit(:name)
  end
end
