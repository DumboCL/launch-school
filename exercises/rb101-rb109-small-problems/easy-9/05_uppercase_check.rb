def uppercase?(string)
  string.chars.each do |char|
    if char =~ /[a-z]/i
      if char.upcase != char
        return false
      end
    end
  end
  return true
end

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true