def staggered_case(string)
  staggered_string = string.chars.map.with_index do |char, i|
                       if i.even?
                         char.upcase
                       elsif i.odd?
                         char.downcase
                       end
                     end

  staggered_string.join                         
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'