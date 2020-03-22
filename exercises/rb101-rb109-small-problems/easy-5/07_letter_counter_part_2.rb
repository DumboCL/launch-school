def word_sizes(sentence)
  count_hash = Hash.new(0)
  sentence.split.each do |word|
    count_hash[word.downcase.gsub(/[^a-z]/, '').size] += 1
  end

  count_hash
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}