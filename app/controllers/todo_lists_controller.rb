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
  end

  def destroy
  end

  private
    def todo_list_params
      params.require(:todo_list).permit(:title, :description, :done)
    end
end
