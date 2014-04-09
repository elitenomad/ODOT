require 'spec_helper'


describe 'Creating Todo Lists' do
  before(:each) do
    visit '/todo_lists'
    click_link 'New Todo list'
  end
  it "redirects todo lists on success" do

    expect(page).to have_content('New todo_list')

    fill_in "Title", with: "First todo list"
    fill_in "Description", with: "This is what i will do today"
    click_button 'Create Todo list'

    expect(page).to have_content("First todo list")
  end

  it "errors out when title is not provided" do
    expect(TodoList.count).to eq(0)


    expect(page).to have_content('New todo_list')

    fill_in "Title", with: ""
    fill_in "Description", with: "This is what i will do today"
    click_button 'Create Todo list'
    expect(page).to have_content('error')

    expect(TodoList.count).to eq(0)
  end

  it "errors out when title is less than 3 chars" do
    expect(TodoList.count).to eq(0)

    
    expect(page).to have_content('New todo_list')

    fill_in "Title", with: "to"
    fill_in "Description", with: "This is what i will do today"
    click_button 'Create Todo list'
    expect(page).to have_content('error')

    expect(TodoList.count).to eq(0)
  end

end