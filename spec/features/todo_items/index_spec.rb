require 'spec_helper'

describe TodoItem do
  let!(:todo_list) { TodoList.create(title:'My first todo', description:'jujujujubi') }
  it 'should return empty when no items are present' do


    visit '/todo_lists'
    within "#todo_list_#{todo_list.id}" do
      click_link 'List items'
    end

    expect(page).to have_content("TodoItems#index")
  end
end