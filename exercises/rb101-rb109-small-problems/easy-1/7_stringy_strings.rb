def stringy(size, start_symbol = '0')
  return_string = ''
  count = 0

  loop do
    break if count == size
    return_string << if count.even?
                      start_symbol
                     else
                      start_symbol.eql?('0')? '1' : '0'
                    end
    count += 1
  end

  return_string
end

puts stringy(6, '1') == '101010'
puts stringy(9, '1') == '101010101'
puts stringy(4, '1') == '1010'
puts stringy(7, '1') == '1010101'