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

  it "should delete todo item successfully" do
    visit_todo_list(todo_list)

    within("#todo_item_#{todo_item.id}") do
      click_link 'Delete Item'
    end

    expect(page).to have_content(todo_list.title)

    expect(todo_list.todo_items.size).to eq(0)
  end
end