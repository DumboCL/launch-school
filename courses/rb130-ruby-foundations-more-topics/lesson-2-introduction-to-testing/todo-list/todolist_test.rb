require "minitest/autorun"
require "minitest/pride"
require "simplecov"
SimpleCov.start

require_relative "todo"

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
    @list.done!
    assert_equal(true, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add("todo") }
    assert_raises(TypeError) { @list.add(23) }
  end

  def test_shovel
    assert_equal(@todos, @list.to_a)
    todo4 = Todo.new("test")
    @list << todo4
    assert_equal([@todo1, @todo2, @todo3, todo4], @list.to_a)
  end

  def test_add_alias
    new_todo = Todo.new("new todo")
    @list.add(new_todo)
    @todos << new_todo
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(4) }
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(40) }
    assert_equal(false, @todo1.done?)
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(40) }
    @todo1.done!
    assert_equal(true, @todo1.done?)
    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
  end

  def test_done!
    @todo1.undone!
    @todo2.undone!
    @todo3.undone!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(40) }
    @list.remove_at(1)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
  ---- Today's Todos ----
  [ ] Buy milk
  [ ] Clean room
  [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
  ---- Today's Todos ----
  [X] Buy milk
  [ ] Clean room
  [ ] Go to gym
    OUTPUT

    @todo1.done!
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
  ---- Today's Todos ----
  [X] Buy milk
  [X] Clean room
  [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    result = []
    @list.each { |todo| result << todo }
    assert_equal([@todo1, @todo2, @todo3], result)
  end

  def test_return_original
    result = []
    test_case = @list.each { |todo| result << todo }
    assert_equal(test_case, @list)
  end

  def test_select
    result = @list.select { |todo| todo == @todo1 }
    assert_instance_of(TodoList, result)
    assert_equal(1, result.size)
    assert_equal([@todo1], result.to_a)
  end
end
