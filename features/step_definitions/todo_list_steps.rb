
Given /the following tasks exist/ do |list_table|
  list_table.hashes.each do |task|
    TodoList.create task
  end
end

# Then /^(?:|I )should see "([^"]*)"$/ do |text|
#   if page.respond_to? :should
#     page.should have_content(text)
#   else
#     assert page.has_content?(text)
#   end
# end


When /^(?:|I )select date "([^"]*)" from "([^"]*)"$/ do |date, field|
  base_id = find(:xpath, ".//label[contains(.,'#{field}')]")[:for]
  year, month, day = date.split('-')
  select(year,  :from => "#{base_id}_1i")
  select(month, :from => "#{base_id}_2i")
  select(day,   :from => "#{base_id}_3i")
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

When /I (un)?check the following priority: (.*)/ do |uncheck, priority_list|
	prios = priority_list.split(',')
  	prios.each do |prio|
		field = "#{prio.strip}"
    		if uncheck
      			uncheck(field)
    		else
      			check(field)
		end
	end
end

Then /^I should (not )?see the following tasks: (.*)$/ do |no, task_list|
  # Take a look at web_steps.rb Then /^(?:|I )should see "([^"]*)"$/
    tasks = task_list.split(',')
  	tasks.each do |task|
		field = "#{task.strip}"
    		if no
      			expect(page).not_to have_content(field)
    		else
      			expect(page).to have_content(field)
    		end
  	end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  Movie.all.each do |movie|
    step %{I should see "#{movie.title}"}
  end
end