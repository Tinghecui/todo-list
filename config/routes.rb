Rottenpotatoes::Application.routes.draw do
  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  # get 'home/index'
  # root 'home#index'

  resources :todo_list, controller: 'todo_list'
  root :to => redirect('/todo_list')
end
