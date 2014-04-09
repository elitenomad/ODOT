require 'spec_helper'

describe "Edit todo lists" do

  it "should return succesful response with correct information" do
    todo_list = TodoList.create(title: 'First todo list', description:'complete the following')

    visit '/todo_lists'
    within "#todo_list_#{todo_list.id}" do
      click_link 'Edit'
    end

    fill_in "Title", with: 'Second Todo list'
    fill_in "Description", with: 'complete the following'
    click_button 'Update Todo list'
    todo_list.reload
    expect(page).to have_content("successfully updated")
    expect(todo_list.title).to eq('Second Todo list')
  end


  it "errors out when title is not provided" do
    todo_list = TodoList.create(title: 'First todo list', description:'complete the following')

    expect(TodoList.count).to eq(1)

    visit '/todo_lists'
    within "#todo_list_#{todo_list.id}" do
      click_link 'Edit'
    end

    fill_in "Title", with: ""
    fill_in "Description", with: "This is what i will do today"
    click_button 'Update Todo list'
    expect(page).to have_content('error')

    expect(TodoList.count).to eq(1)
  end

  it "errors out when title is less than 3 chars" do
    todo_list = TodoList.create(title: 'First todo list', description:'complete the following')

    expect(TodoList.count).to eq(1)

    visit '/todo_lists'
    within "#todo_list_#{todo_list.id}" do
      click_link 'Edit'
    end


    fill_in "Title", with: "to"
    fill_in "Description", with: "This is what i will do today"
    click_button 'Update Todo list'
    expect(page).to have_content('error')

    expect(TodoList.count).to eq(1)
  end
end