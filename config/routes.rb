Rottenpotatoes::Application.routes.draw do
  resources :todo_list, controller: 'todo_list'
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/todo_list')
end
