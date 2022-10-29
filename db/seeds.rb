# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


items = [{:name => 'Homework', :creation_date => '25-Nov-1992', :due_date => '25-Nov-1993'},
			{:name => 'Physics', :creation_date => '25-Nov-1992', :due_date => '25-Nov-1993'},
			{:name => 'Chemistry', :creation_date => '25-Nov-1992', :due_date => '25-Nov-1993'},
			{:name => 'English', :creation_date => '25-Nov-1992', :due_date => '25-Nov-1993'},
			{:name => 'History', :creation_date => '25-Nov-1992', :due_date => '25-Nov-1993'},
  	 ]

items.each do |item|
  TodoList.create!(item)
end