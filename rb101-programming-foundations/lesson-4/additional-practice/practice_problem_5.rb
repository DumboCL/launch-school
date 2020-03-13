flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
target_index = 0

flintstones.each_with_index do |name, index|
  target_index = index if name.start_with?("Be")
end

puts target_index