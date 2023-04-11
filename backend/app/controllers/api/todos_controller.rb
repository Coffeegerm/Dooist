class Api::TodosController < ApplicationController
  load_and_authorize_resource class: "TodoItem"

  def index
    render json: @todos
  end

  def show
    if authorize! :read, @todo
      render json: @todo
    else
      render json: { errors: @todo.errors }, status: :unprocessable_entity
    end
  end

  def create
    @todo = TodoItem.new(create_todo_params)
    if @todo.save
      render json: @todo
    else
      render json: { errros: @todo.errors }, status: :unprocessable_entity
    end
  end

  def update
    @todo = TodoItem.find(params[:id])
    updates = update_todo_params
    complete = updates.delete(:complete)
    @todo.mark_complete! if complete && !@todo.is_complete?
    if @todo.update(updates)
      render json: @todo
    else
      render json: { errros: @todo.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @todo = TodoItem.find(params[:id])
    if @todo.destroy
      render json: @todo.id
    else
      render json: { errros: @todo.errors }, status: :unprocessable_entity
    end
  end

  private

  def create_todo_params
    params.require(:todo).permit(:title, :description)
  end

  def update_todo_params
    params.require(:todo).permit(:title, :description, :complete, :project_id)
  end
end
