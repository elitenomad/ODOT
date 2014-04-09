require 'spec_helper'


describe "Delete todo_lists" do

  it "should successfully delete lists" do
    todo_list = TodoList.create(title:'My first todo', description:'jujujujubi')

    expect(TodoList.count).to eq(1)

    visit '/todo_lists'
    within "#todo_list_#{todo_list.id}" do
      click_link 'Destroy'
    end

    expect(page).to have_content('Listing todo_lists')

    expect(TodoList.count).to eq(0)
  end
end