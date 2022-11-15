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

          
    if priorities != nil
      priorities.each do |key, value|
        @priorities_to_show.append(key)
        # @rating_hash[key] = value
      end
      @todoLists = TodoList.with_priorities(@priorities_to_show)
    # elsif ratings != nil && filter == nil
    #   ratings.each do |key, value|
    #     @priorities_to_show.append(key)
    #     # @rating_hash[key] = value
    #   end
    #   @movies = Movie.with_ratings(@ratings_to_show)
    # elsif ratings == nil 
    #   @movies = Movie.order(filter)
    else 
      @todoLists = TodoList.with_priorities(nil)
    end

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
      params.require(:todo_list).permit(:name, :task_size, :priority, :task_link, :estimate_time, :creation_date, :due_date, :user_id)
    end
  end
  