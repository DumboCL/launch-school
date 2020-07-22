flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do |name, index|
  flintstones[index] = flintstones[index][0,3]
end

puts flintstones
