require 'spec_helper'

describe TodoItem do
  let!(:todo_list) { TodoList.create(title:'My first todo', description:'jujujujubi') }

  def visit_todo_list(list)
    visit '/todo_lists'
    within "#todo_list_#{todo_list.id}" do
      click_link 'List items'
    end
  end

  it "should display title on the pages" do
    visit_todo_list(todo_list)
    within "h1" do
      expect(page).to have_content(todo_list.title)
    end
  end

  it 'should return empty when no items are present' do
    visit_todo_list(todo_list)
    expect(page).to have_content("No Items found")
  end

  it 'should return items in a table when not empty' do
    item1 = todo_list.todo_items.create(content:'have to propose')
    item2 = todo_list.todo_items.create(content:'have to do homework')
    item3 = todo_list.todo_items.create(content:'have to play cricket')
    visit_todo_list(todo_list)

    expect(page.all("table.table tr").size).to eq(3)

  end
end