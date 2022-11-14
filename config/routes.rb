Rottenpotatoes::Application.routes.draw do
  # get 'home/index'
  root 'home#index'

  resources :todo_list, controller: 'todo_list'
  # map '/' to be a redirect to '/movies'
  # root :to => redirect('/todo_list')
end
