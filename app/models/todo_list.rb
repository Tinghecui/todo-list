class TodoList < ActiveRecord::Base
    belongs_to :user
    def self.all_priorities
        ['High', 'Medium', 'Low']
    end 

    def self.with_priorities(priority_list)
        if priority_list != nil 
          TodoList.where(priority: priority_list)
        else 
          TodoList.all
        end 
      end
end
