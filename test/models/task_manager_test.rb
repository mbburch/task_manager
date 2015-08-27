require_relative '../test_helper'

class TaskManagerTest < Minitest::Test

  def setup
    TaskManager.create({id: 1, title: "New task", description: "This task"})
    TaskManager.create({id: 2, title: "Another new task", description: "This other task"})
  end

  def test_it_creates_a_task
    task = TaskManager.find(1)
    assert_equal 1, task.id
    assert_equal "This task", task.description
    assert_equal "New task", task.title
  end

  def test_it_finds_all_tasks
    tasks = TaskManager.all
    assert_equal 2, tasks.count
    assert_equal 1, tasks.first.id
    assert_equal "Another new task", tasks.last.title
  end

  def test_it_finds_specific_task
    task = TaskManager.find(2)
    assert_equal "Another new task", task.title
    assert_equal "This other task", task.description
  end

  def test_it_updates_specific_task
    data = {title: "Updated task", description: "This updated task"}
    updated = TaskManager.update(2, data)
    task = TaskManager.find(2)
    assert_equal "This updated task", task.description
  end

  def test_it_deletes_specific_task
    deleted = TaskManager.delete(1)
    tasks = TaskManager.all
    assert_equal 1, tasks.count
  end

end