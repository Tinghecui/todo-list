require 'rails_helper'

RSpec.describe TodoListController, type: :controller do
  describe "GET index" do
    it "should render index template" do
      get :index
      expect(response).to render_template("todo_list/index")
    end
  end

  describe 'CREATE new task' do
    it 'should create a new task' do
      expect {post :create, todo_list: {:name=> "hw2", :priority => "2"}}.to change {TodoList.count}.by(1)
    end
  end

  describe "EDIT the task" do
    it "should render the edit template" do
      task = TodoList.create!(name: 'hw3', due_date: '2022-11-26')
      get :edit, :id => task.id
      expect(response).to render_template("todo_list/edit")
    end
    it "should update info" do
      TodoList.delete_all
      task = TodoList.create(name: 'hw3', due_date: '2022-11-26')
      post :update, :id => 1, :todo_list => {:priority=> "2"}
      expect(response).to redirect_to todo_list_path(1)
    end
  end

  describe "GET detail" do
    it "should render show template" do
      task = TodoList.create!(name: 'hw3', due_date: '2022-11-26')
      get :show, :id => task.id
      expect(response).to render_template("todo_list/show")
    end
  end

  describe 'DELETE a task' do
    it 'should delete the task' do
      task = TodoList.create!(name: 'hw3', due_date: '2022-11-26')
      delete :destroy, :id => task.id
      expect {TodoList.find(task.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end