class TodoListController < ApplicationController

    def show
      id = params[:id] # retrieve movie ID from URI route
      @todoList = TodoList.find(id) # look up movie by unique ID
      # will render app/views/movies/show.<extension> by default
    end
  
    def index
      @todoLists = TodoList.all
    end
  
    def new
      # default: render 'new' template
    end
  
    def create
      @todoList = TodoList.create!(todo_list_params)
      flash[:notice] = "#{@todoList.name} was successfully created."
      redirect_to todo_list_index_path
    end
  
    def edit
      @todoList = TodoList.find params[:id]
    end
  
    def update
      @todoList = TodoList.find params[:id]
      @todoList.update_attributes!(todo_list_params)
      flash[:notice] = "#{@todoList.name} was successfully updated."
      redirect_to todo_list_path(@todoList)
    end
  
    def destroy
      @todoList = TodoList.find params[:id]
      @todoList.destroy
      flash[:notice] = "Item '#{@todoList.name}' deleted."
      redirect_to todo_list_index_path
    end
  
    # private
    # # Making "internal" methods private is not required, but is a common practice.
    # # This helps make clear which methods respond to requests, and which ones do not.
    def todo_list_params
      params.require(:todo_list).permit(:name, :creation_date, :due_date)
    end
  end
  