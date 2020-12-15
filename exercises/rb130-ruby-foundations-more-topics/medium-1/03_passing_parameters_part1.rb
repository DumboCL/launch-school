items = %w[apple corn cabbage wheat]

def gather(items)
  return unless block_given?

  puts "Let's start gathering food."
  yield(items)
  puts 'Nice selection of food we have gathered!'
end

gather(items) { |products| puts products.join(', ') }

gather(items) do |produce|
  puts "We've gathered some vegetables: #{produce[1]} and #{produce[2]}"
end
