class Element
  attr_accessor :next
  attr_reader   :value

  def initialize(value, next_elem = nil)
    @value = value
    @next = next_elem
  end

  def datum
    value
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  def initialize
    @head = nil
  end

  def size
    size = 0
    current_elem = @head
    while current_elem
      size += 1
      current_elem = current_elem.next
    end

    size
  end

  def empty?
    @head.nil?
  end

  def peek
    @head&.datum
  end

  def head
    @head
  end

  def push(value)
    element = Element.new(value, @head)
    @head = element
  end

  def pop
    datum = peek
    new_head = @head.next
    @head = new_head
    datum
  end

  def find_tail
    node = @head

    loop do
      break unless node.next

      node = node.next
    end

    node
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end

  def to_a
    arr = []
    current_elem = @head
    while current_elem
      arr << current_elem.datum
      current_elem = current_elem.next
    end

    arr
  end

  def self.from_a(arr)
    list = SimpleLinkedList.new
    return list if arr.nil?

    arr.reverse.each do |datum|
      list.push(datum)
    end

    list
  end
end
