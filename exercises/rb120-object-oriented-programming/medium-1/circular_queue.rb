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