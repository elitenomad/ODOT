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

  def edit
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.todo_items.find(params[:id])
  end

  def update
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.todo_items.find(params[:id])
    if @todo_item.update(todo_item_params)
      redirect_to todo_list_todo_items_path(@todo_list), notice: 'Updated todo item sucessfully'
    else
      render :edit, error:'Issues with the information provided'
    end
  end

  def destroy
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.todo_items.find(params[:id])

    @todo_item.destroy
    redirect_to todo_list_todo_items_path(@todo_list)
  end


  private

    def todo_item_params
      params.require(:todo_item).permit(:content)
    end
end
