class TodoList < ActiveRecord::Base
    belongs_to :user
    validate :due_date_cannot_be_in_the_past

    def due_date_cannot_be_in_the_past
      if due_date.present? && due_date < Date.today
        errors.add(:due_date, "can't be in the past")
      end
    end    

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
