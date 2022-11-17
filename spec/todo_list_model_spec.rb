require 'rails_helper'

describe TodoList do
  describe 'find' do
    it 'should add new task' do
      TodoList.create(:name => "hw1", :priority =>"High")
      expect(TodoList.find_by(:name => 'hw1')).to_not be_nil
    end
  end

  describe 'find' do
    it 'should add new task' do
      TodoList.create(:name => "hw2", :priority =>"Medium", :task_link => "www.google.com")
      expect(TodoList.find_by(:name => 'hw2')).to_not be_nil
    end
  end

  describe 'find' do
    it 'should edit current task' do
      TodoList.create(:name => "hw", :priority =>"Medium", :task_link => "www.google.com")
      # expect(TodoList.find_by(:name => 'hw')).to_not be_nil
      hw = TodoList.find(1)
      hw.name = 'new_hw'
      hw.save
      expect(TodoList.find_by(:name => 'new_hw')).to_not be_nil

    end
  end


  describe 'find' do
    it 'should be able to create multiple tasks' do
      TodoList.create(:name => "hw", :priority =>"Medium", :task_link => "www.google.com")
      TodoList.create(:name => "testtest", :priority =>"Low", :task_link => "www.google.com")
      # expect(TodoList.find_by(:name => 'hw')).to_not be_nil
      expect(TodoList.find_by(:name => 'hw')).to_not be_nil
      expect(TodoList.find_by(:name => 'testtest')).to_not be_nil

    end
  end

  describe 'find' do
    it 'should be able to delete task' do
      TodoList.create(:name => "hw", :priority =>"Medium", :task_link => "www.google.com")
      TodoList.create(:name => "testtest", :priority =>"Low", :task_link => "www.google.com")
      # expect(TodoList.find_by(:name => 'hw')).to_not be_nil
      expect(TodoList.find_by(:name => 'hw')).to_not be_nil
      expect(TodoList.find_by(:name => 'testtest')).to_not be_nil

      hw = TodoList.find(1)
      hw.destroy
      hw = TodoList.find(2)
      hw.destroy

      expect(TodoList.find_by(:name => 'testtest')).to be_nil


    end
  end

end