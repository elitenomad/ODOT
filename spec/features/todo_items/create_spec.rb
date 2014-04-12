require 'spec_helper'


describe 'Creating Todo List Items' do
  let!(:todo_list) { TodoList.create(title:'My first todo', description:'jujujujubi') }

  before(:each) do
    visit '/todo_lists'
    within "#todo_list_#{todo_list.id}" do
      click_link 'List items'
    end
  end

  it "should save todo item with a valid content" do
    click_link 'New Todo Item'
    fill_in 'Content', with: 'Marriage anniversary'
    click_button 'Save'
    expect(page).to have_content('Added todo item')
    expect(todo_list.todo_items.count).to eq(1)
  end
end