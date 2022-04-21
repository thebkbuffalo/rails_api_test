class TodoListsController < ApplicationController
  def index
    todo_lists = TodoList.order('created_at desc')
    render json: todo_lists
  end

  def create
    new_todo_list = TodoList.create(todo_list_params)
    render json: new_todo_list
  end

  def update
    list_item = TodoList.find(params[:id])
    list_item.done = params[:payload][:isDone]
    list_item.save
    render json: list_item
  end

  def destroy
    list_item = TodoList.find(params[:id])
    list_item.destroy
    render json: list_item
  end

  private
    def todo_list_params
      params.require(:todo_list).permit(:title, :description, :done)
    end
end
