def word_sizes(sentence)
  count_hash = {}
  sentence.split.each do |word|
    if count_hash[word.size] == nil
      count_hash[word.size] = 1
    else
      count_hash[word.size] += 1
    end
  end

  count_hash
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}