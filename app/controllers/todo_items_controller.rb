class TodoItemsController < ApplicationController

  before_action :todo_list_fetch
  before_action :todo_item_fetch , only: [:edit,:update,:destroy,:complete]

  def index
    @todo_items = @todo_list.todo_items
  end

  def new
    @todo_item = @todo_list.todo_items.new
  end

  def create
    @todo_item = @todo_list.todo_items.new(todo_item_params)

    if @todo_item.save
      redirect_to todo_list_todo_items_path(@todo_list), notice:'Added todo item successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @todo_item.update(todo_item_params)
      redirect_to todo_list_todo_items_path(@todo_list), notice: 'Updated todo item sucessfully'
    else
      render :edit, error:'Issues with the information provided'
    end
  end

  def destroy
    @todo_item.destroy
    redirect_to todo_list_todo_items_path(@todo_list)
  end

  def complete
    @todo_item.update(completed_at: Time.now)
    flash[:notice] = "Todo item marked complete"
    redirect_to todo_list_todo_items_path(@todo_list)
  end
  private

    def todo_list_fetch
      @todo_list = TodoList.find(params[:todo_list_id])
    end

    def todo_item_fetch
      @todo_item = @todo_list.todo_items.find(params[:id])
    end

    def todo_item_params
      params.require(:todo_item).permit(:content)
    end
end
