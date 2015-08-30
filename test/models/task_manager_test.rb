require_relative '../test_helper'

class TaskManagerTest < Minitest::Test

  def test_it_creates_a_task
    task1 = TaskManager.create({title: "New task", description: "This task"})
    found_task = TaskManager.find(task1.id)
    assert_equal "New task", found_task.title
    assert_equal "This task", found_task.description
  end

  def test_it_finds_all_tasks
    TaskManager.create({title: "New task", description: "This task"})
    TaskManager.create({title: "Another new task",
                        description: "This other task"})
    assert_equal 2, TaskManager.all.count
  end

  def test_it_finds_a_task
    task1 = TaskManager.create({title: "New task", description: "This task"})
    task2 = TaskManager.create({title: "Another new task",
                                description: "This other task"})
    found_task = TaskManager.find(task2.id)
    assert_equal "Another new task", found_task.title
    assert_equal "This other task", found_task.description
  end

  # def test_it_can_update_a_task
  #   task = TaskManager.update(@task_1.id, @attributes_two)
  #   updated_task = TaskManager.find(@task_1.id)
  #   assert_equal "New task 2", updated_task.title
  # end

  def test_it_updates_a_task
    task_1 = TaskManager.create({title: "Another new task",
                               description: "This other task"})
    assert_equal "This other task", task_1.description
    task_1.description = "This updated task"
    TaskManager.update(task_1.id, {title: "Another new task 2",
                               description: "This updated task"})
    updated_task = TaskManager.find(task_1.id)

    assert_equal "Another new task 2", updated_task.title
    assert_equal "This updated task", updated_task.description
  end

  def test_it_deletes_a_task
    task  = TaskManager.create({title: "New task", description: "This task"})
    task2 = TaskManager.create({title: "Another new task",
                                description: "This other task"})
    TaskManager.delete(task.id)
    tasks = TaskManager.all
    assert_equal 1, tasks.count
  end
end