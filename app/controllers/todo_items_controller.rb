class TodoItemsController < ApplicationController
  def index
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_items = @todo_list.todo_items
  end

  def new
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.todo_items.new
  end

  def create
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.todo_items.new(todo_item_params)

    if @todo_item.save
      redirect_to todo_list_todo_items_path(@todo_list), notice:'Added todo item successfully'
    else
      render :new
    end
  end


  private

    def todo_item_params
      params.require(:todo_item).permit(:content)
    end
end
