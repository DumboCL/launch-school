UPCASE = ('A'..'Z').to_a
DOWNCASE = ('a'..'z').to_a

def swapcase(string)
  new_array = []
  string.chars.each do |char|
    if UPCASE.include?(char)
      new_array << char.downcase
    elsif DOWNCASE.include?(char)
      new_array << char.upcase
    else
      new_array << char
    end
  end
  
  new_array.join
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'