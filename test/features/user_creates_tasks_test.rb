require_relative "../test_helper"

class UserCreatesTasksTest < FeatureTest

  def test_it_can_create_a_task
    visit "/"
    click_on("New Task")
    fill_in("task[title]", with: "Go home")
    fill_in("task[description]", with: "It's been a long day")
    click_on("Submit")

    assert_equal "/tasks", current_path
    assert page.has_content?("Go home")
  end
end