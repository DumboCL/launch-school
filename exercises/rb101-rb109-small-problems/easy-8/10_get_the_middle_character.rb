def center_of(string)
  if string.length.odd?
    string[(string.length/2).floor]
  else
    string[(string.length/2)-1, 2]
  end
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'