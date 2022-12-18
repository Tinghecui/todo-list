class TodoListController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    def show
      id = params[:id] # retrieve movie ID from URI route
      @todoList = TodoList.find(id) # look up movie by unique ID
      # will render app/views/movies/show.<extension> by default
    end
  
    def index
      @todoLists = TodoList.all
      @all_priorities = TodoList.all_priorities
      @priorities_to_show = []

      priorities = params[:priorities]
      todo_list = params[:todo_list]

      if todo_list != nil && todo_list[:time_frame] != nil
        @default_time_frame = todo_list[:time_frame]
      else 
        @default_time_frame = 'all'
      end

      if priorities != nil
        priorities.each do |key, value|
          @priorities_to_show.append(key)
        end
        @todoLists = TodoList.with_priorities(@priorities_to_show, @default_time_frame)
      else 
        @todoLists = TodoList.with_priorities(nil, @default_time_frame)
      end

      @todoLists = @todoLists.order("due_date")

    end
  
    def new
      # default: render 'new' template
    end
  
    def create
      begin
        @todoList = TodoList.create!(todo_list_params)
        flash[:notice] = "#{@todoList.name} was successfully created."
        redirect_to todo_list_index_path
      rescue ActiveRecord::RecordInvalid => exception
        flash[:warning] =  "Due date should not be in the past!"
        redirect_to new_todo_list_path
      end
    end
  
    def edit
      @todoList = TodoList.find params[:id]
    end
  
    def update
      @todoList = TodoList.find params[:id]
      begin
        @todoList.update_attributes!(todo_list_params)
        flash[:notice] = "#{@todoList.name} was successfully updated."
        redirect_to todo_list_path(@todoList)
      rescue ActiveRecord::RecordInvalid => exception
        flash[:warning] =  "Due date should not be in the past!"
        redirect_to edit_todo_list_path(@todoList)
      end
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
      params.require(:todo_list).permit(:name, :task_size, :priority, :task_link, :estimate_time, :creation_date, :due_date, :user_id)
    end
  end
  