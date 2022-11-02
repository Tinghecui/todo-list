# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


items = [{:name => 'Homework1', :creation_date => '10-Nov-2022', :due_date => '11-Nov-2022',
			:priority => '1', :task_link => 'http://www.cs.columbia.edu/~junfeng/22fa-w4152/assignments.html'},
		{:name => 'Physics', :creation_date => '15-Nov-2022', :due_date => '25-Nov-2022', :priority => '2'}
  	 ]

items.each do |item|
  TodoList.create!(item)
end