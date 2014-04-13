require 'spec_helper'


describe 'Deleting Todo List Items' do
  let!(:todo_list) { TodoList.create(title:'My first todo', description:'jujujujubi') }
  let!(:todo_item) { todo_list.todo_items.create(content: 'Marriage anniversary') }

  def visit_todo_list(list)
    visit '/todo_lists'
    within "#todo_list_#{todo_list.id}" do
      click_link 'List items'
    end
  end
  it "should mark item complete" do
    visit_todo_list(todo_list)
    expect(todo_item.completed_at).to be_nil

    within("#todo_item_#{todo_item.id}") do
      click_link 'Mark Complete'
    end

    todo_item.reload
    expect(todo_item.completed_at).to_not be_nil

  end
end
