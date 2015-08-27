require_relative '../test_helper'

class TaskTest < Minitest::Test

  def test_it_assigns_the_proper_attributes
    attributes = {"id" => 1, "title" => "New task", "description" => "This task"}
    task = Task.new(attributes)

    assert_equal 1, task.id
    assert_equal "This task", task.description
    assert_equal "New task", task.title
  end

end