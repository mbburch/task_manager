require_relative "../test_helper"

class UserEditsTasksTest < FeatureTest

  def setup
    TaskManager.create({id: 1, title: "New task", description: "This task"})
    # TaskManager.create({id: 2, title: "Another new task", description: "This other task"})
  end

  def test_it_can_edit_a_task
    visit "/tasks"
    click_on("Edit")
    fill_in("task[title]", with: "Go home now")
    fill_in("task[description]", with: "It's been a long day for real")
    click_on("Submit")

    assert_equal "/tasks/1", current_path
    assert page.has_content?("Go home now")
  end
end