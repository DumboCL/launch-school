# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = "X".freeze
  UNDONE_MARKER = " ".freeze

  attr_accessor :title, :description, :done

  def initialize(title, description = "")
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(other)
    title == other.title &&
      description == other.description &&
      done == other.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, "Can only add Todo objects" if todo.class != Todo

    todos << todo

    todos
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos.clone
  end

  def done?
    todos.all?(&:done?)
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def item_at(pos)
    todos.fetch(pos)
  end

  def mark_done_at(pos)
    # todos.fetch(pos).done!
    item_at(pos).done!
  end

  def mark_undone_at(pos)
    # todos.fetch(pos).undone!
    item_at(pos).undone!
  end

  def remove_at(pos)
    todos.fetch(pos)
    todos.delete_at(pos)
  end

  def done!
    todos.each(&:done!)
  end

  def each
    todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    select_todos = TodoList.new("selected todo list")
    each do |todo|
      select_todos.add(todo) if yield(todo)
    end
    select_todos
  end

  def find_by_title(title)
    find { |todo| todo.title.eql?(title) }
  end

  def all_done
    select(&:done?)
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(str)
    find_by_title(title)&.done!
  end

  def mark_all_done
    each(&:done!)
  end

  def mark_all_undone
    each(&:undone!)
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  alias_method :<<, :add

  protected

  attr_accessor :todos

end


# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# # ---- Adding to the list -----

# # add
# p list.add(todo1)                 # adds todo1 to end of list, returns list
# p list.add(todo2)                 # adds todo2 to end of list, returns list
# p list.add(todo3)                 # adds todo3 to end of list, returns list
# # list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# # <<
# # same behavior as add

# # ---- Interrogating the list -----

# # size
# p list.size                       # returns 3

# # first
# p list.first                      # returns todo1, which is the first item in the list

# # last
# p list.last                       # returns todo3, which is the last item in the list

# #to_a
# p list.to_a                      # returns an array of all items in the list

# #done?
# p list.done?                     # returns true if all todos in the list are done, otherwise false

# # ---- Retrieving an item in the list ----

# # item_at
# # list.item_at                    # raises ArgumentError
# p list.item_at(1)                 # returns 2nd item in list (zero based index)
# # list.item_at(100)               # raises IndexError

# # ---- Marking items in the list -----

# # mark_done_at
# # list.mark_done_at               # raises ArgumentError
# p list.mark_done_at(1)            # marks the 2nd item as done
# # list.mark_done_at(100)          # raises IndexError

# # mark_undone_at
# # list.mark_undone_at             # raises ArgumentError
# p list.mark_undone_at(1)          # marks the 2nd item as not done,
# # list.mark_undone_at(100)        # raises IndexError

# # done!
# puts "before all done"
# puts list
# list.done!                      # marks all items as done
# puts "after all done"
# puts list
# # ---- Deleting from the list -----

# # shift
# # list.shift                      # removes and returns the first item in list

# # pop
# # list.pop                        # removes and returns the last item in list
# # puts list

# # remove_at
# # list.remove_at                  # raises ArgumentError
# list.remove_at(1)               # removes and returns the 2nd item
# # list.remove_at(100)             # raises IndexError
# puts list

# # ---- Outputting the list -----

# # to_s
# puts list.to_s                      # returns string representation of the list

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [ ] Clean room
# # [ ] Go to gym

# # or, if any todos are done

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [X] Clean room
# # [ ] Go to gym

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo # calls Todo#to_s
end

todo1.done!

results = list.select(&:done?) # you need to implement this method

puts results.inspect

puts list.all_done
