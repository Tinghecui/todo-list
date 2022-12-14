# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the (RottenPotatoes )?home\s?page$/ then '/todo_list'
    when /^the sign up page$/ then '/users/sign_up'
    when /^the log in page$/ then '/users/sign_in'
    when /^the edit profile page$/ then '/users/edit'

    when /^the edit page for "(.*)"$/
      todo_id = TodoList.find_by(name: $1).id
      # puts todo_id
      edit_todo_list_path(todo_id)

    when /^the details page for "(.*)"$/
      todo_id = TodoList.find_by(name: $1).id
      # puts todo_id
      todo_list_path(todo_id)


    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
