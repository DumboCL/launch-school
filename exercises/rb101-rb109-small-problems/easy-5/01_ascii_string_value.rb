def ascii_value(text)
  sum = 0
  text.chars.each { |char| sum += char.ord }

  sum
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0