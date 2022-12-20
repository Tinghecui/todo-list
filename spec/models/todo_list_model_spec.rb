require 'rails_helper'

describe TodoList do
  it "is valid with valid attributes" do
    expect(TodoList.new).to be_valid
  end
  

  describe 'find' do
    it 'should add new task' do
      TodoList.create(:name => "hw1", :priority =>"High")
      expect(TodoList.find_by(:name => 'hw1')).to_not be_nil
    end
    it 'should add new task' do
      TodoList.create(:name => "hw2", :priority =>"Medium", :task_link => "www.google.com")
      expect(TodoList.find_by(:name => 'hw2')).to_not be_nil
    end
  end

  describe 'with_priorities' do
    it 'should return all the pirority' do
      TodoList.create(:name => "hw3", :priority =>"Low")
      expect(TodoList.all_priorities).to match_array(['High', 'Medium', 'Low']) 
    end
    it 'should return all the tasks' do
      expect(TodoList.with_priorities(nil, "All", "All")).to eq(TodoList.all)
    end
    it 'should return low pirority' do
      expect(TodoList.with_priorities("Low", "All", "All")).to eq(TodoList.where(priority: "Low"))
    end
    it 'should return Medium pirority' do
      expect(TodoList.with_priorities("Medium", "All", "All")).to eq(TodoList.where(priority: "Medium"))
    end
    it 'should return High pirority' do
      expect(TodoList.with_priorities("High", "All", "All")).to eq(TodoList.where(priority: "High"))
    end

  end


  describe 'with priorities' do
    it 'should return tasks with High and Low pirority' do
      TodoList.create(:name => "hw1", :priority =>"High", :due_date => "2023-1-16")
      TodoList.create(:name => "hw1", :priority =>"Medium", :due_date => "2023-1-17")
      TodoList.create(:name => "hw2", :priority =>"Low", :due_date => "2023-1-20")
      expect(TodoList.with_priorities(["High", "Low"], "All", "All")).to eq(TodoList.where(priority: ["High", "Low"]))
    end
    it 'should return all the tasks within 1 month' do
      TodoList.create(:name => "hw1", :priority =>"High", :due_date => "2023-1-16")
      expect(TodoList.with_priorities(nil, "1m", "All")).to_not be_nil
    end
    it 'should return tasks with status in process' do
      TodoList.create(:name => "hw1", :priority =>"High", :due_date => "2023-1-16", :task_size => "In Process")
      expect(TodoList.with_priorities(nil, "All", "In Process")).to eq(TodoList.where(task_size: "In Process"))
    end
    it 'should return tasks with status complete' do
      TodoList.create(:name => "hw1", :priority =>"High", :due_date => "2023-1-16", :task_size => "In Process")
      TodoList.create(:name => "hw2", :priority =>"Medium", :due_date => "2023-1-16", :task_size => "Complete")
      expect(TodoList.with_priorities(nil, "All", "Complete")).to eq(TodoList.where(task_size: "Complete"))
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