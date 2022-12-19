# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
		{:email => 'test123@gmail.com', :password => '123456',},
  	 ]

users.each do |u|
	User.create!(u)
end


items = [{:name => 'Homework1', :user => User.find(1), :due_date => '16-Jan-2023', :task_size => "No",
			:priority => 'High', :task_link => 'http://www.cs.columbia.edu/~junfeng/22fa-w4152/assignments.html'},
		{:name => 'Physics', :user => User.find(1), :due_date => '20-Jan-2023', :task_size => "No", :priority => 'Medium'}
  	 ]

items.each do |item|
  TodoList.create!(item)
end