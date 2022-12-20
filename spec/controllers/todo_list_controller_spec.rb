require 'rails_helper'
require_relative '../support/devise'

RSpec.describe TodoListController, type: :controller do
  describe "GET " do
    login_user

    context 'from login user' do
      it 'should return 200:OK' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET " do
    signout_user

    context 'from signout user' do
      it 'should return 200:OK' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET " do
    login_user
    context 'index with time frame' do
      it 'should return 200:OK' do
        get :index, todo_list:{:time_frame=> '1d'}
        expect(response).to have_http_status(:success)
      end
    end
  end


  describe "GET " do
    login_user
    context 'index with done' do
      it 'should return 200:OK' do
        get :index, todo_list:{:done=> 'Complete'}
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET " do
    login_user
    context 'index with pirority' do
      it 'should return 200:OK' do
        get :index, :priorities => ['High']
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET index" do
    it "should render index template" do
      get :index
      expect(response).to render_template("todo_list/index")
    end
  end

  describe 'CREATE new task' do
    login_user
    it 'should create a new task' do
      expect {post :create, todo_list: {:name=> "hw2", :priority => "High"}}.to change {TodoList.count}.by(1)
    end
    it 'should fail to create a new task' do
      expect {post :create, todo_list: {:name => "hw2", :priority =>"Medium", :due_date => "2021-11-1"}}.to change {TodoList.count}.by(0)
    end
  end


  describe "EDIT the task" do
    login_user
    it "should render the edit template" do
      task = TodoList.create!(name: 'hw3', due_date: '2023-1-26')
      get :edit, :id => task.id
      expect(response).to render_template("todo_list/edit")
    end
    it "should update info" do
      TodoList.delete_all
      task = TodoList.create(name: 'hw3', due_date: '2023-1-26')
      post :update, :id => 1, :todo_list => {:priority=> "Low"}
      expect(response).to redirect_to todo_list_path(1)
    end
    it "should update info" do
      TodoList.delete_all
      task = TodoList.create(name: 'hw3', due_date: '2023-1-26', task_size: 'In Process')
      post :update, :id => 1, :todo_list => {:task_size => "Complete"}
      expect(response).to redirect_to todo_list_path(1)
    end
    it "should fail to update info" do
      TodoList.delete_all
      task = TodoList.create(name: 'hw3', due_date: '2023-1-26')
      post :update, :id => 1, :todo_list => {:due_date=> "2022-11-20"}
      expect(response).to redirect_to edit_todo_list_path(1)
    end
  end

  describe "GET detail" do
    it "should render show template" do
      task = TodoList.create!(name: 'hw3', due_date: '2023-1-26')
      get :show, :id => task.id
      expect(response).to render_template("todo_list/show")
    end
  end

  describe 'DELETE a task' do
    login_user
    it 'should delete the task' do
      task = TodoList.create!(name: 'hw3', due_date: '2023-1-26')
      delete :destroy, :id => task.id
      expect {TodoList.find(task.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end


  # describe 'Use movie helper' do
  #   login_user
  #   it 'should Use movie helper' do
  #     expect helper.oddness(1).to equal('odd')
  #   end
  # end
  

end