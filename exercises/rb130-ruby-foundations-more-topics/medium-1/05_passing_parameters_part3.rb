items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# output 1
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!
gather(items) do |*part1, last_one|
  puts part1.join(', ')
  puts last_one
end

puts

# output 2
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!
gather(items) do |first, *middle, last|
  puts first
  puts middle.join(', ')
  puts last
end

puts

# output 3
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!
gather(items) do |first, *rest|
  puts first
  puts rest.join(', ')
end

puts

# output 4
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!
gather(items) do |first, second, third, last|
  puts "#{first}, #{second}, #{third}, and #{last}"
end
