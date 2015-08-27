require_relative "../test_helper"

class UserSeesAllTasksTest < FeatureTest
    def test_all_tasks_are_displayed
      visit "/"
      assert page.has_content?("Welcome to the Task Manager")
    end

    def test_front_page_has_specific_content
      visit "/"
      within("#greeting") do
        assert page.has_content?("Welcome to the Task Manager")
      end
    end

end