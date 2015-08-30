require_relative "../test_helper"

class UserSeesAllTasksTest < FeatureTest

  def creates_task
    visit "/"
    click_on("New Task")
    fill_in("task[title]", with: "Go home")
    fill_in("task[description]", with: "It's been a long day")
    assert_equal "/tasks/new", current_path
    click_on("Submit")
  end

  def test_user_can_fill_in_task_form
    creates_task
    assert_equal "/tasks", current_path

    assert page.has_content?("Go home")
  end

  def test_it_can_edit_a_task
    creates_task
    click_on("Edit")
    fill_in("task[title]", with: "Go home now")
    fill_in("task[description]", with: "It's been a long day for real")
    click_on("Update Task")

    assert page.has_content?("Go home now")
  end

  def test_it_can_delete_a_task
    creates_task
    assert_equal "/tasks", current_path
    click_button("Delete")

    assert_equal "/tasks", current_path
    refute page.has_content?("Go home")
  end

end