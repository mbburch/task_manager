require_relative "../test_helper"

class UserDeletesTasksTest < FeatureTest

  def setup
    TaskManager.create({id: 1, title: "New task", description: "This task"})
    # TaskManager.create({id: 2, title: "Another new task", description: "This other task"})
  end

  def test_it_can_delete_a_task
    visit "/tasks"
    click_button("Delete")

    assert_equal "/tasks", current_path
    refute page.has_content?("Go home now")
  end
end