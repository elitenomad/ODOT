Odot::Application.routes.draw do
  resources :todo_lists do
    resources :todo_items
  end
end
