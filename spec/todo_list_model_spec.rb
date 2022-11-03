require 'rails_helper'

describe TodoList do
  describe 'find' do
    it 'should add new task' do
      TodoList.create(:name => "hw1", :priority =>"1")
      expect(TodoList.find_by(:name => 'hw1')).to_not be_nil
    end
  end

end