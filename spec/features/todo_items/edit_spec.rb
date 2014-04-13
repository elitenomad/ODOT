require 'spec_helper'

describe 'Editing Todo List Items' do
  let!(:todo_list) { TodoList.create(title:'My first todo', description:'jujujujubi') }
  let!(:todo_item) { todo_list.todo_items.create(content: 'Marriage anniversary') }

  def visit_todo_list(list)
    visit '/todo_lists'
    within "#todo_list_#{todo_list.id}" do
      click_link 'List items'
    end
  end

  it "should edit and save with valid content" do
    visit_todo_list(todo_list)

    within("#todo_item_#{todo_item.id}") do
      click_link 'Edit Item'
    end
    fill_in 'Content', with: 'Lots of milk'
    click_button 'Save'

    expect(page).to have_content(todo_list.title)

    todo_item.reload
    expect(todo_item.content).to eq('Lots of milk')
  end
end