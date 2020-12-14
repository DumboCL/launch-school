class CircularQueue
  attr_accessor :queue, :quantity

  def initialize(size)
    @queue = Array.new(size)
    @quantity = 0
  end

  def dequeue
    return nil if quantity == 0
    self.quantity -= 1
    queue.push(nil)
    queue.shift
  end

  def enqueue(obj)
    if quantity == maximum
      queue.rotate!
      queue[-1] = obj
    else
      add_new(obj)
    end
  end

  def add_new(obj)
    maximum.times do |index|
      if queue[index].nil?
        queue[index] = obj
        self.quantity += 1
        break
      end
    end
  end

  private

  def maximum
    queue.size
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
p queue.queue == [1, nil, nil]
queue.enqueue(2)
p queue.queue == [1, 2, nil]
puts queue.dequeue == 1
p queue.queue == [2, nil, nil]

queue.enqueue(3)
p queue.queue == [2, 3, nil]
queue.enqueue(4)
p queue.queue == [2, 3, 4]
puts queue.dequeue == 2
p queue.queue == [3, 4, nil]

queue.enqueue(5)
p queue.queue == [3, 4, 5]
queue.enqueue(6)
p queue.queue == [4, 5, 6]
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

=begin


req
- enqueue
  - added after the most recent
- dequeue
  - remove oldest (first)
- enqueue over max size
  - remove oldest
  - replace in position
- dequeue an empty buffer
  - return nil

- assume not nil objects
- can use nil for empty buffer positions

Data Structure
- Integer
store index that references oldest element in buffer

- Array
[nil, nil, nil]
1, 2, 3
4, 2, 3

Algorithms

enqueue
 - oldest = (oldest + 1) % buffer.size if all not nil
   add to buffer (reassign index) at next index
   next = (next + 1) % buffer.size


dequeue
-   store oldest
    reassign oldest position to nil
    oldest = (oldest + 1) % buffer.size if store not nil
    return oldest position
[nil, nil, nil]
1, 2, 3


dequeue


=end

class CircularQueue
  def initialize(size)
    @buffer    = Array.new(size, nil)
    @oldest    = 0
    @available = 0
  end

  def dequeue
    store = @buffer[@oldest]
    @buffer[@oldest] = nil
    @oldest = move_to_next(@oldest) if !store.nil?
    store
  end

  def enqueue(obj)
    @oldest = move_to_next(@oldest) if !@buffer[@available].nil?
    @buffer[@available] = obj
    @available = move_to_next(@available)
    nil
  end

  private

  def move_to_next(pos)
    (pos + 1) % @buffer.size
  end

end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1
# 2

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2
# 3 4

queue.enqueue(5)
queue.enqueue(6)
# 3 4 5 6
queue.enqueue(7)
# 4 5 6 7
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil