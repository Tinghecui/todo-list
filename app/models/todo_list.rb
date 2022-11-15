class TodoList < ActiveRecord::Base
    belongs_to :user
    def self.all_priorities
        ['High', 'Medium', 'Low']
    end 

    def self.with_priorities(priority_list)
        # if ratings_list is an array such as ['G', 'PG', 'R'], retrieve all
        #  movies with those ratings
        if priority_list != nil 
          TodoList.where(priority: priority_list)
        else 
          TodoList.all
        end 
      end
end
