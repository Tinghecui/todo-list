class TodoList < ActiveRecord::Base
    belongs_to :user
    def self.all_priorities
        ['High', 'Medium', 'Low']
    end 

    def self.with_priorities(priority_list, time_frame)
        if priority_list != nil 
          list = TodoList.where(priority: priority_list)
        else 
          list = TodoList.all
        end

        if time_frame == '1d'
          list = list.where(due_date: Date.today..1.day.from_now)
        elsif time_frame == '1w' 
          list = list.where(due_date: Date.today..1.week.from_now)
        elsif time_frame == '1m'
          list = list.where(due_date: Date.today..1.month.from_now)
        end 

        return list
    end
end
