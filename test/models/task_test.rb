require_relative '../test_helper'

class TaskTest < Minitest::Test
  def test_it_assigns_the_proper_attributes
    task = Task.new({ :title => "New task",
                      :description => "This task",
                      :id => 1 })

    assert_equal 1, task.id
    assert_equal "This task", task.description
    assert_equal "New task", task.title
  end
end